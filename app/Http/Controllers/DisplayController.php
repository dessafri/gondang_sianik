<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Repositories\ServiceRepository;

class DisplayController extends Controller
{
    public $services;

    public function __construct(ServiceRepository $services)
    {
        $this->services = $services;
    }
    public function showDisplayUrl()
    {
        return view('display.index', 
        ['services' => $this->services->getAllActiveServicesWithLimits(), 
        'date' => Carbon::now()->toDateString(), 
        'settings' => Setting::first(),
        'file'=>'storage/app/public/tokens_for_display.json']);
    }
}
