<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pc extends Model
{
    use HasFactory;

    protected $table = 'pc';
    protected $primaryKey = 'id_pc';

    // 🔹 Kolom yang bisa diisi (fillable)
    protected $fillable = [
        'id_mst_laboratorium',
        'no_order',
        'tgl_order',
        'lama_order',
        'banyak_contoh',
        'tujuan_pengujian',
        'tujuan_pengujian_ket',
        'bahasa_lhu',
        'tgl_samplingmulai',
        'tgl_samplingselesai',
        'nomor_bapc',
        'keterangan_tambahan',
        'badanusaha_customerdn',
        'nama_customer',
        'badanusaha_customerln',
        'alamat_customer',
        'alamatpabrik_customer',
        'nip_input',
        'tgl_input',
    ];

    // 🔹 Relasi: Satu PC punya banyak analisa
    public function pcanalisa()
    {
        return $this->hasMany(Pcanalisa::class, 'id_pc');
    }
}
