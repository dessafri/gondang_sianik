<?php

namespace App\Http\Controllers;

use App\Models\ApiData;
use Illuminate\Http\Request;

class ApiData extends Controller
{
    public function index()
    {
        $data = ApiData::all();
        return response()->json(['data' => $data]);
    }
}
