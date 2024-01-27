<?php

namespace App\Repositories;

use App\Models\OperationalTime;
use Illuminate\Support\Facades\Storage;

class OperationalRepository
{
    public function getAllOperational()
    {
        return OperationalTime::get();
    }

    public function getOperationalById($id)
    {
        return OperationalTime::find($id);
    }
    public function create($data)
    {
        $operational_time = OperationalTime::create([
            'on_time' => $data['on_time'],
            'off_time' => $data['off_time'],
            'day' => $data['day'],
            'status' => $data['status']
        ]);
        return $operational_time;
    }
    public function update($data, $operational_time)
    {
        $operational_time->on_time = $data['on_time'];
        $operational_time->off_time = $data['off_time'];
        $operational_time->day = $data['day'];
        $operational_time->status = $data['status'];
        $operational_time->save();
        return $operational_time;
    }
    public function delete($data, $operational_time)
    {
        Storage::delete('public/operational_time_' . $operational_time->id . '_display.json');
        $operational_time->delete();
    }
}
