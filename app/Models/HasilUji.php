<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilUji extends Model
{
    use HasFactory;

    protected $table = 'hasil_uji';
    protected $primaryKey = 'id_hasil_uji';

    // 🔹 Kolom yang bisa diisi (fillable)
    protected $fillable = [
        'id_pcpar',
        'hasil_uji_in',
        'hasil_uji_en',
        'ketidakpastian_in',
        'ketidakpastian_en',
        'limitdeteksi_in',
        'limitdeteksi_en',
        'satuan_in',
        'satuan_en',
        'simulan_in',
        'simulan_en',
        'suhu_in',
        'suhu_en',
        'waktu_in',
        'waktu_en',
        'nip_input',
        'tgl_input',
    ];

    // 🔹 Relasi ke tabel Pcpar (Many-to-One)
    public function pcpar()
    {
        return $this->belongsTo(Pcpar::class, 'id_pcpar');
    }
}
