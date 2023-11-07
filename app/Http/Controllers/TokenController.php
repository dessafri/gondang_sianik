<?php

namespace App\Http\Controllers;

use App\Jobs\SendSmsJob;
use App\Models\Call;
use App\Models\Queue;
use App\Models\Service;
use App\Models\Setting;
use App\Repositories\ServiceRepository;
use App\Repositories\TokenRepository;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use charlieuki\ReceiptPrinter\ReceiptPrinter as ReceiptPrinter;

class TokenController extends Controller
{
    public $services, $tokenRepository;

    public function __construct(ServiceRepository $services, TokenRepository $tokenRepository)
    {
        $this->services = $services;
        $this->tokenRepository = $tokenRepository;
    }

    //memanggil semua service dann menampilkan di index issue_token
    public function issueToken()
    {
        return view(
            'issue_token.index',
            ['services' => $this->services->getAllActiveServices(), 'settings' => Setting::first()]
        );
    }

    //input ke antrian dan mendapatkan token
    public function createToken(Request $request, Service $service)
    {
        DB::beginTransaction();
        try {
            $service = Service::findOrFail($request->service_id);

            $request->validate([
                'service_id' => 'required|exists:services,id',
                'with_details' => 'required',
                'name' => Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->name_required == 1);
                }),
                'email' => [Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->email_required == 1);
                })],
                'phone' => [Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->email_required == 1);
                })],

            ]);
            $queue = $this->tokenRepository->createToken($service, $request->all(), $request->with_details ? true : false);
            $customer_waiting = $this->tokenRepository->customerWaiting($service);
            $customer_waiting = $customer_waiting > 0 ?  $customer_waiting - 1 : $customer_waiting;
            $settings = Setting::first();
            if ($service->sms_enabled && $service->optin_message_enabled && $queue->phone && $settings->sms_url) {
                SendSmsJob::dispatch($queue, $service->optin_message_format, $settings, 'issue_token');
            }
            $this->tokenRepository->setTokensOnFile();
        } catch (\Exception $e) {
            if ($e instanceof \Illuminate\Validation\ValidationException) {
                $errors = $e->errors();
                $message = $e->getMessage();
                return response()->json(['status_code' => 422, 'errors' => $errors]);
            }
            DB::rollback();
            return response()->json(['status_code' => 500]);
        }
        DB::commit();
        $queue = $queue->load('service');
        return response()->json(['status_code' => 200, 'queue' => $queue, 'customer_waiting' => $customer_waiting, 'settings' => $settings]);
    }

    public function createTokenOnline(Request $request, Service $service)
    {
        DB::beginTransaction();
        try {
            $service = Service::findOrFail($request->service_id);

            $request->validate([
                'service_id' => 'required|exists:services,id',
                'with_details' => 'required',
                'name' => Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->name_required == 1);
                }),
                'email' => [Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->email_required == 1);
                })],
                'phone' => [Rule::requiredIf(function () use ($request, $service) {
                    return $request->with_details && ($service->email_required == 1);
                })],

            ]);
            $queue = $this->tokenRepository->createToken($service, $request->all(), $request->with_details ? true : false);
            $customer_waiting = $this->tokenRepository->customerWaiting($service);
            $customer_waiting = $customer_waiting > 0 ?  $customer_waiting - 1 : $customer_waiting;
            $settings = Setting::first();
            if ($service->sms_enabled && $service->optin_message_enabled && $queue->phone && $settings->sms_url) {
                SendSmsJob::dispatch($queue, $service->optin_message_format, $settings, 'issue_token');
            }
            $this->tokenRepository->setTokensOnFile();
        } catch (\Exception $e) {
            if ($e instanceof \Illuminate\Validation\ValidationException) {
                $errors = $e->errors();
                $message = $e->getMessage();
                return response()->json(['status_code' => 422, 'errors' => $errors]);
            }
            DB::rollback();
            return response()->json(['status_code' => 500]);
        }
        DB::commit();
        $queue = $queue->load('service');
        return response()->json(['status_code' => 200, 'queue' => $queue, 'customer_waiting' => $customer_waiting, 'settings' => $settings]);
    }

    public function printToken(Request $request)
    {
        // dump($request);exit;
        // $queue = $queue->load('service');
        // dd($settings);exit;
        $printer = new ReceiptPrinter;
        $printer->init(
            config('receiptprinter.connector_type'),
            config('receiptprinter.connector_descriptor')
        );
        
        $printer->setQueue($request->name, $request->location, $request->service_name, $request->que_letter, $request->que_number, $request->que_date, $request->customer_waiting);
        //dd($settings); exit;
        $printer->printReceiptQueue();
        return response()->json(['status_code' => 200]);
    }
}
