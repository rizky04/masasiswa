<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pcpar extends Model
{
    use HasFactory;

    protected $table = 'pcpar';
    protected $primaryKey = 'id_pcpar';

    // 🔹 Kolom yang bisa diisi (fillable)
    protected $fillable = [
        'id_pcanalisa',
        'id_produk',
        'id_parameter',
        'id_sub_parameter',
        'id_syarat_mutu',
        'urutan',
        'nama_parameter_in',
        'nama_parameter_en',
        'id_parameterinduk',
        'id_parameterdetil_induk',
        'jenispcpar',
        'hargasatuan',
        'satuan_in',
        'satuan_en',
        'limitdeteksi_in',
        'limitdeteksi_en',
        'metoda_in',
        'metoda_en',
        'baku_mutu_in',
        'baku_mutu_en',
        'nip_input',
        'tgl_input',
        'nip_petugas',
        'tgl_penugasan',
        'alasan_perubahan_penugasan',
        'tgl_analis_selesai',
        'nip_validasikorlab_subkon',
        'tgl_validasikorlab_subkon',
        'catatan_korlab',
        'tgl_catatan_korlab',
        'nip_catatan_korlab',
    ];

    // 🔹 Relasi ke tabel Pcanalisa (Many-to-One)
    public function pcanalisa()
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa');
    }

    // 🔹 Relasi ke tabel HasilUji (One-to-One)
    public function hasilUji()
    {
        return $this->hasOne(HasilUji::class, 'id_pcpar');
    }
    

        // 🔹 Relasi ke tabel mst_parameter
    public function parameter()
    {
        return $this->belongsTo(MstParameter::class, 'id_parameter', 'id');
    }

}
