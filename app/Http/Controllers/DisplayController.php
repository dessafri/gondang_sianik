<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Repositories\ReportRepository;
use App\Repositories\ServiceRepository;
use App\Repositories\CallRepository;

class DisplayController extends Controller
{
    public $services,$callRepository;

    public function __construct(ServiceRepository $services,CallRepository $callRepository,ReportRepository $reportRepository)
    {
        $this->services = $services;
        $this->callRepository = $callRepository;
        $this->reportRepository = $reportRepository;
    }

    public function showDisplayUrl()
    {
        return view('display.index', 
        ['services' => $this->services->getAllActiveServicesWithLimits(), 
        'calls' => $this->callRepository->getCallsForAntrian(), 
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'datatokens'=> $this->callRepository->getCallsForDisplay2(),
        'file'=>'storage/app/public/tokens_for_display.json']);
    }

    public function showDisplayServicesUrl()
    {
        return view('display.services', 
        ['services' => $this->services->getAllActiveServices(), 
        'calls' => $this->callRepository->getCallsForAntrian(), 
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'file'=>'storage/app/public/tokens_for_display.json']);
    }

    public function showDisplayOnlineUrl()
    {
        return view('display.online', 
        ['services' => $this->services->getAllActiveServicesWithLimits(),
        'calls' => $this->services->getCallsForAntrian(),
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'file'=>'storage/app/public/tokens_for_display-online.json']);
    }

    public function showDisplayOnlineServiceUrl()
    {
        return view('display.online-service', 
        ['services' => $this->services->getAllActiveServicesWithLimits(),
        'calls' => $this->services->getCallsForAntrian(),
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'file'=>'storage/app/public/tokens_for_display-online.json']);
    }
}