<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OperationalTime extends Model
{
    use HasFactory;
    protected $table = 'operational_time';

    protected $fillable = [
        'on_time',
        'off_time',
        'day',
        'status'
    ];
}
