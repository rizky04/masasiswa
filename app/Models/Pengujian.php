<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengujian extends Model
{
    /** @use HasFactory<\Database\Factories\PengujianFactory> */
    use HasFactory;
    protected $fillable = [
        'contoh_uji',
        'data_teknis',
        'program_uji',
        'hasil_uji',
        'kesimpulan',
        'foto',
    ];
}
