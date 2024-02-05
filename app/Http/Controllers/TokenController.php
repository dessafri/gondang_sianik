<?php

namespace App\Http\Controllers;

use App\Jobs\SendSmsJob;
use App\Models\Call;
use App\Models\Queue;
use App\Models\Service;
use App\Models\OperationalTime;
use App\Models\Setting;
use App\Repositories\ServiceRepository;
use App\Repositories\OperationalRepository;
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
        $date = now();
        $dayOfWeek = $date->format('l');
        $timeNow = $date->format('H:i:s');

        $operationalTime = OperationalTime::where('day', $dayOfWeek)
        ->where('status', 'Offline')
        ->where('on_time', '<=', $timeNow)
        ->where('off_time', '>=', $timeNow)
        ->first();

        $time = OperationalTime::where('day', $dayOfWeek)
        ->where('status', 'Online')
        ->first();

        return view(
            'issue_token.index',
            ['services' => $this->services->getAllActiveServicesWithLimits(), 
            'settings' => Setting::first(),
            'operationalTime' => $operationalTime,
            'time' => $time,
            ]
        );
    }

    public function onlineToken()
    {
        $date = now();
        $dayOfWeek = $date->format('l');
        $timeNow = $date->format('H:i:s');

        $operationalTime = OperationalTime::where('day', $dayOfWeek)
        ->where('status', 'Online')
        ->where('on_time', '<=', $timeNow)
        ->where('off_time', '>=', $timeNow)
        ->first();

        $time = OperationalTime::where('day', $dayOfWeek)
        ->where('status', 'Online')
        ->first();
        
        return view(
            'online_token.index',
            ['services' => $this->services->getAllActiveServicesWithLimitsOnline(), 
            'settings' => Setting::first(),
            'operationalTime' => $operationalTime,
            'time' => $time,
        ]);
    }

    //input ke antrian dan mendapatkan token
    public function createToken(Request $request, Service $service)
    {
        $date = now();
        $dayOfWeek = $date->format('l');
        $timeNow = $date->format('H:i:s');
        $operationalTime = OperationalTime::where('day', $dayOfWeek)
        ->where('status', 'Offline')
        ->first();

        // if (!$operationalTime) {
        //     // Tidak ada jam operasional yang ditemukan untuk hari ini
        //     return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian tidak tersedia hari ini.']]]);
        // }
        // if ($timeNow <= $operationalTime->on_time || $timeNow >= $operationalTime->off_time) {
        //     return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian diluar jam operasional.']]]);
        // }
            // Memeriksa batas antrian seperti yang sudah Anda lakukan sebelumnya
            $totalQueueToday = Queue::whereDate('created_at', $date->toDateString())
            ->where('service_id', $request->service_id)
            ->count(); // Menghitung total antrian pada tanggal saat ini
            $queueLimit = DB::table('services')->where('id', $request->service_id)->value('offline_limit');
            if ($totalQueueToday >= $queueLimit) {
                return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian sudah Mencapai Limit.']]]);
            }else{
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
    }

    public function createTokenOnline(Request $request, Service $service)
    { 
        $requestDate = $request->date;
        $date_data = Carbon::parse($requestDate);

        $dayOfWeek = $date_data->format('l'); 
        
        // Mengambil data jam operasional untuk hari ini dari tabel operational_time
        // $operationalTime = OperationalTime::where('day', $dayOfWeek)
        // ->where('status', 'Online')
        // ->first();
        // if (!$operationalTime) {
        //     // Tidak ada jam operasional yang ditemukan untuk hari ini
        //     return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian tidak tersedia hari ini.']]]);
        // }
        
        // $date = now();
        // $timeNow = $date->format('H:i:s');
        // if ($timeNow <= $operationalTime->on_time || $timeNow >= $operationalTime->off_time) {
        //     return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian diluar jam operasional.']]]);
        // }
            // Validasi batas maksimum antrian
            $totalQueueToday = Queue::whereDate('created_at', $request->date)
            ->where('service_id', $request->service_id)
            ->count(); // Menghitung total antrian pada tanggal saat ini
            $queueLimit = DB::table('services')->where('id', $request->service_id)->value('online_limit');
            if ($totalQueueToday >= $queueLimit) {
                return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, Antrian sudah Mencapai Limit. Silahkan datang untuk Antri Offline']]]);
            }else{
                $phoneNumber = $request->phone;
                $created_at = $request->date;
                
                if (empty($phoneNumber)) {
                    return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Nomor telepon tidak terdeteksi. Silahkan chat ulang Whatsapp LASMINI']]]);
                }

                $existingQueue = Queue::whereDate('created_at', $created_at)
                                    ->where('phone', $phoneNumber)
                                    ->exists();
                if ($existingQueue) {
                    return response()->json(['status_code' => 422, 'errors' => ['limit' => ['Maaf, nomor telepon ini sudah membuat antrian pada tanggal ini.']]]);
                } else {
                    DB::beginTransaction();
                    try {
                        $service = Service::findOrFail($request->service_id);

                        $request->validate([
                            'service_id' => 'required|exists:services,id',
                            'with_details' => 'required',
                            'date' => [Rule::requiredIf(function () use ($request, $service) {
                                return $request->with_details && ($service->date_required == 1);
                            })],
                        ]);

                        // Proses pembuatan token hanya jika validasi berhasil dan jumlah antrian masih di bawah batas
                        $queue = $this->tokenRepository->createTokenOnline($service, $request->all(), $request->with_details ? true : false);
                        $customer_waiting = $this->tokenRepository->customerWaiting($service);
                        $customer_waiting = $customer_waiting > 0 ?  $customer_waiting - 1 : $customer_waiting;
                        $settings = Setting::first();
                        
                        if ($service->sms_enabled && $service->optin_message_enabled && $queue->phone && $settings->sms_url) {
                            SendSmsJob::dispatch($queue, $service->optin_message_format, $settings, 'issue_token');
                        }

                        $this->tokenRepository->setTokensOnFile();
                    } catch (\Exception $e) {
                        dd($e->getMessage());
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
            }
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
        // dd($request);
        //dd($settings); exit;
        $printer->printReceiptQueue();
        dd($request);
        
        
        return response()->json(['status_code' => 200]);
    }
}
