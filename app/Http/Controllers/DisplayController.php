<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Repositories\ServiceRepository;
use App\Repositories\CallRepository;

class DisplayController extends Controller
{
    public $services,$callRepository;

    public function __construct(ServiceRepository $services,CallRepository $callRepository)
    {
        $this->services = $services;
        $this->callRepository = $callRepository;
    }
    public function showDisplayUrl()
    {
        return view('display.index', 
        ['services' => $this->services->getAllActiveServicesWithLimits(), 
        'calls' => $this->callRepository->getCallsForAntrian(), 
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'file'=>'storage/app/public/tokens_for_display.json']);
    }
}
