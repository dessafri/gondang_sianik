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
            'position' => $this->customerWaiting($service) + 1
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
            'name' => $data['name'],
            'email' => ($is_details && $service->ask_email == 1) ? $data['email'] : null,
            'phone' => $data['phone'],
            'position' => $this->customerWaiting($service) + 1,
            'created_at' => $data['date'],
            'updated_at' => $data['date'],
        ]);

        $reply_message = 
            "*_Bukti Reservasi Sistem Antrian Online_*
            *_Dinas Kependudukan Dan Pencatatan Sipil Kabupaten Nganjuk_*
            Nama : ".$data['name']."
            Tanggal : ".$data['date']."

            *_Silahkan datang pada tanggal yang tertera. Terima Kasih_*";

        $post = [
            'userId' => $data['id'],
            'message' => $reply_message
        ];
            
        $ch = curl_init('http://10.35.18.8/lasmini.salipuk/sendMessage');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        
        $response = curl_exec($ch);
        // echo $response;

        // $post = [
        //     'userId' => $data['id'],
        //     'message' => $reply_message
        // ];
        
        // $vpn_url = 'http://10.35.18.8/lasmini.salipuk/sendMessage';
        // $vpn_settings = [
        //     CURLOPT_URL            => $vpn_url,
        //     CURLOPT_RETURNTRANSFER => true,
        //     CURLOPT_POSTFIELDS     => $post,
        //     CURLOPT_PROXY          => 'http://10.35.18.8:80',
        //     CURLOPT_PROXYUSERPWD   => 'adminserver:disdukchatbot',
        //     CURLOPT_PROXYTYPE      => CURLPROXY_HTTP, // Sesuaikan dengan jenis VPN yang Anda gunakan
        // ];

        // // Inisialisasi cURL dengan pengaturan VPN
        // $ch = curl_init();
        // curl_setopt_array($ch, $vpn_settings);

        // // Eksekusi cURL dan dapatkan respons
        // $response = curl_exec($ch);

        // // Tutup koneksi cURL
        curl_close($ch);
        
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
