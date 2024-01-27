<?php

namespace App\Repositories;

use App\Models\Call;
use App\Models\Queue;
use App\Models\Service;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

class TokenRepository
{
    public function createToken(Service $service, $data, $is_details)
    {
        $last_token = Queue::where('created_at', '>=', Carbon::now()->startOfDay())
        ->where('created_at', '<', Carbon::now()
        ->endOfDay())->where('service_id', $service->id)
        ->orderBy('created_at', 'desc')
        ->first();
        if ($last_token) $token_number = $last_token->number + 1;
        else $token_number = $service->start_number;
        $queue = Queue::create([
            'service_id' => $service->id,
            'number' => $token_number,
            'called' => false,
            'reference_no' => Str::random(9),
            'letter' => $service->letter,
            'name' => ($is_details && $service->ask_name == 1) ? $data['name'] : null,
            'email' => ($is_details && $service->ask_email == 1) ? $data['email'] : null,
            'phone' => ($is_details && $service->ask_phone == 1) ? $data['phone'] : null,
            'position' => $this->customerWaiting($service) + 1,
            'nik' => ($is_details && $service->ask_nik == 1) ? $data['nik'] : null,
            'status_queue' => "Offline"
        ]);

        return $queue;
    }

    public function createTokenOnline(Service $service, $data, $is_details)
    {
        $date_add = date('Y-m-d' ,strtotime($data['date']. '+1 day'));
        $last_token = Queue::where('created_at', '>=', $data['date'])
        ->where('created_at', '<', $date_add)
        ->where('service_id', $service->id)
        ->orderBy('number', 'desc')
        ->first();
        if ($last_token) $token_number = $last_token->number + 1;
        else $token_number = $service->start_number;
        $queue = Queue::create([
            'service_id' => $service->id,
            'number' => $token_number,
            'called' => false,
            'reference_no' => Str::random(9),
            'letter' => $service->letter,
            'name' => ($data['name'] != '') ? $data['name'] : null,
            'email' => ($data['email'] != '') ? $data['email'] : null,
            'phone' => ($data['phone'] != '') ? $data['phone'] : null,
            'position' => $this->customerWaiting($service) + 1,
            'created_at' => $data['date'],
            'updated_at' => $data['date'],
            'nik' => $data['nik'],
            'status_queue' => "Online"
        ]);

        
        $reply_message = 
        "*_Bukti Reservasi Sistem Antrian Online_*
        Dinas Kependudukan Dan Pencatatan Sipil Kabupaten Nganjuk
        Atas Nama : ".$data['name']."
        Antrian : ".$service->letter." - ".$token_number."
        Tanggal : " . date('d F Y', strtotime($data['date'])) . "

        Silahkan datang pada tanggal yang tertera. Terima Kasih
        *_Mohon datang tepat waktu, Pelayanan sesuai dengan nomer pendaftaran , apabila 3x panggilan tidak ada, maka akan dilayani setelah no antrian terakhir_*.";

        $post = [
            'userId' => $data['email'],
            'message' => $reply_message
        ];
        
        $curl_message = curl_init();

            curl_setopt_array($curl_message, array(
            CURLOPT_URL => 'http://lasmini.cloud/api/sendMessage',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($post),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                'Cookie: PHPSESSID=fib4rasu96joh5opks1ubre3g5'
            ),
            ));

        $response_message = curl_exec($curl_message);
        curl_close($curl_message);
        
        return $queue;
    }

    public function customerWaiting(Service $service)
    {
        $count = Queue::where('created_at', '>=', Carbon::now()->startOfDay())->where('created_at', '<=', Carbon::now())
            ->where('called', false)->where('service_id', $service->id)->count();
        return $count;
    }

    public function getTokensForCall($service)
    {
        $tokens = Queue::where('created_at', '>=', Carbon::now()->startOfDay())->where('created_at', '<=', Carbon::now())
            ->where('called', false)->where('service_id', $service->id)->get()->toArray();
        return $tokens;
    }

    public function getCalledTokens($service, $counter)
    {
        $tokens =  Call::where('created_at', '>=', Carbon::now()->startOfDay())->where('created_at', '<=', Carbon::now())
            ->where('service_id', $service->id)->where('counter_id', $counter->id)->orderByDesc('created_at')->get()->toArray();
        return $tokens;
    }

    public function setTokensOnFile()
    {
        $tokens_for_call = Queue::where('created_at', '>=', Carbon::now()->startOfDay())->where('created_at', '<=', Carbon::now())
            ->where('called', false)->get()->toArray();
        $called_tokens =  Call::where('created_at', '>=', Carbon::now()->startOfDay())->where('created_at', '<=', Carbon::now())
            ->orderByDesc('created_at')->get()->toArray();
        $data['tokens_for_call'] = $tokens_for_call;
        $data['called_tokens'] = $called_tokens;
        Storage::put('public/tokens_for_callpage.json', json_encode($data));
    }
}
