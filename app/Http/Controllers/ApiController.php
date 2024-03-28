<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Throwable;
use App\Repositories\ReportRepository;

class ApiController extends Controller
{
    protected $reportRepository;
    public function __construct(ReportRepository $reportRepository)
    {
        $this->reportRepository = $reportRepository;
    }
    public function getAntrianList()
    {
        $antrianList = $this->reportRepository->getAntrianListReport();

        return response()->json(['antrian_list' => $antrianList], 200);
    }
}
