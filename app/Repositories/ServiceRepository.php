<?php

namespace App\Repositories;

use App\Models\Service;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class ServiceRepository
{
    public function getAllServices()
    {
        return Service::get();
    }

    public function getAllActiveServices()
    {
        return Service::where('status', true)
            ->orWhere('status_online', true)
            ->get();
    }

    public function getAllActiveServicesOffline()
    {
        return Service::where('status', true)->get();
    }

    public function getAllActiveServicesOnline()
    {
        return Service::where('status_online', true)->get();
    }

    public function getAllActiveServicesWithLimits()
    {
        $today = Carbon::today();

        return DB::table('services')
        ->select(
            'services.id',
            'services.name',
            'services.letter',
            'services.start_number',
            'services.status',
            'services.sms_enabled',
            'services.optin_message_enabled',
            'services.call_message_enabled',
            'services.noshow_message_enabled',
            'services.completed_message_enabled',
            'services.status_message_enabled',
            'services.optin_message_format',
            'services.call_message_format',
            'services.noshow_message_format',
            'services.completed_message_format',
            'services.status_message_format',
            'services.status_message_positions',
            'services.ask_name',
            'services.name_required',
            'services.ask_email',
            'services.email_required',
            'services.ask_phone',
            'services.phone_required',
            'services.created_at',
            'services.updated_at',
            'services.offline_limit',
            'services.online_limit',
            'services.status_online',
            'services.ask_nik',
            DB::raw('services.offline_limit - COUNT(queues.id) as remaining_limit')
        )
        ->leftJoin('queues', function ($join) use ($today) {
            $join->on('services.id', '=', 'queues.service_id')
                ->whereDate('queues.created_at', '=', $today)
                ->where('queues.status_queue', '=', 'Offline');
        })
        ->where('services.status', 1)
        ->groupBy(
            'services.id',
            'services.name',
            'services.letter',
            'services.start_number',
            'services.status',
            'services.sms_enabled',
            'services.optin_message_enabled',
            'services.call_message_enabled',
            'services.noshow_message_enabled',
            'services.completed_message_enabled',
            'services.status_message_enabled',
            'services.optin_message_format',
            'services.call_message_format',
            'services.noshow_message_format',
            'services.completed_message_format',
            'services.status_message_format',
            'services.status_message_positions',
            'services.ask_name',
            'services.name_required',
            'services.ask_email',
            'services.email_required',
            'services.ask_phone',
            'services.phone_required',
            'services.created_at',
            'services.updated_at',
            'services.offline_limit',
            'services.online_limit',
            'services.status_online',
            'services.ask_nik'
        )
        ->get();
    }

    public function getAllActiveServicesWithLimitsOnline()
    {
        $tomorrow = Carbon::today();

        return DB::table('services')
        ->select(
            'services.id',
            'services.name',
            'services.letter',
            'services.start_number',
            'services.status',
            'services.sms_enabled',
            'services.optin_message_enabled',
            'services.call_message_enabled',
            'services.noshow_message_enabled',
            'services.completed_message_enabled',
            'services.status_message_enabled',
            'services.optin_message_format',
            'services.call_message_format',
            'services.noshow_message_format',
            'services.completed_message_format',
            'services.status_message_format',
            'services.status_message_positions',
            'services.ask_name',
            'services.name_required',
            'services.ask_email',
            'services.email_required',
            'services.ask_phone',
            'services.phone_required',
            'services.created_at',
            'services.updated_at',
            'services.offline_limit',
            'services.online_limit',
            'services.status_online',
            'services.ask_nik',
            DB::raw('services.online_limit - COUNT(queues.id) as remaining_limit')
        )
        ->leftJoin('queues', function ($join) use ($tomorrow) {
            $join->on('services.id', '=', 'queues.service_id')
                ->whereDate('queues.created_at', '=', $tomorrow)
                ->where('queues.status_queue', '=', 'Online');
        })
        ->where('services.status_online', 1)
        ->groupBy(
            'services.id',
            'services.name',
            'services.letter',
            'services.start_number',
            'services.status',
            'services.sms_enabled',
            'services.optin_message_enabled',
            'services.call_message_enabled',
            'services.noshow_message_enabled',
            'services.completed_message_enabled',
            'services.status_message_enabled',
            'services.optin_message_format',
            'services.call_message_format',
            'services.noshow_message_format',
            'services.completed_message_format',
            'services.status_message_format',
            'services.status_message_positions',
            'services.ask_name',
            'services.name_required',
            'services.ask_email',
            'services.email_required',
            'services.ask_phone',
            'services.phone_required',
            'services.created_at',
            'services.updated_at',
            'services.offline_limit',
            'services.online_limit',
            'services.status_online',
            'services.ask_nik'
        )
        ->get();
    }
    
    public function getCallsForAntrian()
    {
        $today = Carbon::today();
        $tomorrow = Carbon::tomorrow();
        
        return DB::table('services')
        ->where('services.status_online', true)
        ->Orwhere('services.status', '>=', true)
        ->leftJoin('queues', 'services.id', '=', 'queues.service_id')
        ->where('queues.created_at', '>=', $today)
        ->where('queues.created_at', '<', $tomorrow)
        ->select(
            'services.*',
            DB::raw('MAX(CASE WHEN queues.called = 1 THEN queues.letter ELSE NULL END) AS letter_called'),
            DB::raw('MAX(CASE WHEN queues.called = 1 THEN queues.number ELSE NULL END) AS number_called'),
        )
        ->groupBy('services.id')
        ->get()->toArray();
    }

    public function getServiceById($id)
    {
        return Service::find($id);
    }
    
    public function create($data)
    {
        if (!isset($data['sms'])) $data['sms'] = false;
        $service = Service::create([
            'name' => $data['name'],
            'letter' => $data['letter'],
            'start_number' => $data['start_number'],
            'status' => 1,
            'status_online' => 1,
            'ask_phone' => $data['ask_phone'],
            'phone_required' => $data['ask_phone'] == 1 ?  $data['phone_required'] : false,
            'sms_enabled' => $data['ask_phone'] == 1 ? $data['sms'] : false,
            'optin_message_enabled' => ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['optin_message'] : false,
            'call_message_enabled' => ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['call_message'] : false,
            'noshow_message_enabled' => ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['noshow_message'] : false,
            'completed_message_enabled' => ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['completed_message'] : false,
            'status_message_enabled' => ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['status_message'] : false,
            'optin_message_format' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['optin_message'] == 1) ? str_replace("'", "`", $data['optin_message_format']) : null,
            'call_message_format' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['call_message'] == 1) ? str_replace("'", "`", $data['call_message_format']) : null,
            'noshow_message_format' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['noshow_message'] == 1) ? str_replace("'", "`", $data['noshow_message_format']) : null,
            'completed_message_format' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['completed_message'] == 1) ? str_replace("'", "`", $data['completed_message_format']) : null,
            'status_message_format' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['status_message'] == 1) ? str_replace("'", "`", $data['status_message_format']) : null,
            'status_message_positions' => ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['status_message'] == 1) ?  $data['status_message_positions'] : null,
            'ask_name' => $data['ask_name'],
            'name_required' => $data['ask_name'] == 1 ? $data['name_required'] : false,
            'ask_email' => $data['ask_email'],
            'email_required' => $data['ask_email'] == 1 ? $data['email_required'] : false,
            'offline_limit' => $data['offline_limit'],
            'online_limit' => $data['online_limit'],
            'ask_nik' => $data['ask_nik'],
            'combined_limit' => $data['combined_limit'],
            'limit' => $data['limit'],
        ]);
        return $service;
    }

    public function update($data, $service)
    {
        if (!isset($data['sms'])) $data['sms'] = false;

        $service->name = $data['name'];
        $service->letter = $data['letter'];
        $service->start_number = $data['start_number'];
        $service->sms_enabled = $data['sms'];
        $service->optin_message_enabled = ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['optin_message'] : false;
        $service->call_message_enabled = ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['call_message'] : false;
        $service->noshow_message_enabled = ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['noshow_message'] : false;
        $service->completed_message_enabled = ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['completed_message'] : false;
        $service->status_message_enabled = ($data['ask_phone'] == 1 && $data['sms'] == 1) ? $data['status_message'] : false;
        $service->optin_message_format = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['optin_message'] == 1) ? str_replace("'", "`", $data['optin_message_format']) : null;
        $service->call_message_format = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['call_message'] == 1) ? str_replace("'", "`", $data['call_message_format']) : null;
        $service->noshow_message_format = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['noshow_message'] == 1) ? str_replace("'", "`", $data['noshow_message_format'])  : null;
        $service->completed_message_format = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['completed_message'] == 1) ? str_replace("'", "`", $data['completed_message_format']) : null;
        $service->status_message_format = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['status_message'] == 1) ? str_replace("'", "`", $data['status_message_format']) : null;
        $service->status_message_positions = ($data['ask_phone'] == 1 && $data['sms'] == 1 && $data['status_message'] == 1) ? $data['status_message_positions'] : null;
        $service->ask_name = $data['ask_name'];
        $service->name_required = ($data['ask_name'] == 1) ? $data['name_required'] : false;
        $service->ask_email = $data['ask_email'];
        $service->email_required = ($data['ask_email'] == 1) ? $data['email_required'] : false;
        $service->ask_phone = $data['ask_phone'];
        $service->phone_required = ($data['ask_phone'] == 1) ? $data['phone_required'] : false;
        $service->online_limit = $data['online_limit'];
        $service->offline_limit = $data['offline_limit'];
        $service->ask_nik = $data['ask_nik'];
        $service->combined_limit = $data['combined_limit'];
        $service->limit = $data['limit'];
        $service->save();
        return $service;
    }

    public function delete($data, $service)
    {
        Storage::delete('public/service_' . $service->id . '_display.json');
        $service->delete();
    }
}
