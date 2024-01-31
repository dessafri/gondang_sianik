<?php

namespace App\Exports;

use App\Models\Queue;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class QueueExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection($startingDate = null, $endingDate = null)
    {
        $query = Queue::select(['letter', 'number', 'name', 'phone', 'nik', 'created_at', 'status_queue']);

        // Tambahkan kondisi berdasarkan starting_date dan ending_date jika disertakan
        if ($startingDate && $endingDate) {
            $query->whereBetween('created_at', [$startingDate, $endingDate]);
        }

        return $query->get();
    }

    public function headings(): array
    {
        return [
            'Nomor Antrian',
            'Nama',
            'Telepon',
            'NIK',
            'Tanggal',
            'Jenis Antrian',
        ];
    }

    public function map($row): array
    {
        $token = $row->letter . '-' . $row->number;
        return [
            'Nomor Antrian' => $token,
            'Nama' => $row->name,
            'Telepon' => $row->phone,
            'NIK' => $row->nik,
            'Tanggal' => $row->created_at,
            'Jenis Antrian' => $row->status_queue,
        ];
    }
}
