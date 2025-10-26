<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Pcanalisa extends Model
{
    use HasFactory;

    protected $table = 'pcanalisa';
    protected $primaryKey = 'id_pcanalisa';

    // 🔹 Kolom yang bisa diisi (fillable)
    protected $fillable = [
        'id_pc',
        'id_standar_uji',
        'nopcanalisa',
        'layanan_cepat',
        'spm',
        'tgl_perkiraan_analisaselesai',
        'jenis_analisa',
        'nomor_bapc',
        'file_bapc',
        'tgl_samplingmulai',
        'tgl_samplingselesai',
        'namasample_indo',
        'namasample_inggris',
        'merek',
        'tipe_indo',
        'tipe_inggris',
        'keterangan',
        'filedatadukung',
        'id_produk',
        'nama_produk',
        'status',
        'alasan_batal',
        'filedatadukung_batal',
        'tgl_batal',
        'nip_batal',
        'kendala',
        'tgl_kendala',
        'nip_kendala',
        'nip_mt',
        'tgl_proses_mt',
        'nip_penanggungjawab',
        'tgl_penanggungjawab',
        'tgl_terima_korlab',
        'tgl_terima_sample',
        'tgl_penugasan',
        'lhucatatan_in',
        'lhucatatan_en',
        'lhukesimpulan_in',
        'lhukesimpulan_en',
        'tgl_validasilhu_korlab',
        'tgl_validasilhu_mt',
        'status_validasilhu_mt',
        'ket_validasilhu_mt',
        'kan',
        'foto',
        'template_lhu',
        'limitdeteksi',
        'nip_penandatangan',
        'tgl_cetaklhu',
        'nip_cetaklhu',
        'filelhu',
        'tgl_upload',
        'nip_upload',
    ];

    // 🔹 Relasi ke tabel PC (Many-to-One)
    public function pc()
    {
        return $this->belongsTo(Pc::class, 'id_pc');
    }

    // 🔹 Relasi ke tabel Pcpar (One-to-Many)
    public function pcpar()
    {
        return $this->hasMany(Pcpar::class, 'id_pcanalisa');
    }
    public function produk()
    {
        return $this->belongsTo(\App\Models\MstProduk::class, 'id_produk', 'id');
    }


    public function contohUji(): BelongsTo
    {
        return $this->belongsTo(ContohUji::class, 'id_pcanalisa', 'id_pcanalisa');
    }

    public function dataTeknisKemasan(): HasMany
    {
        return $this->hasMany(DataTeknisKemasan::class, 'id_pcanalisa', 'id_pcanalisa');
    }

    public function dataTeknisIdentifikasi(): HasMany
    {
        return $this->hasMany(DataTeknisIdentifikasi::class, 'id_pcanalisa', 'id_pcanalisa');
    }

    public function programUji(): HasMany
    {
        return $this->hasMany(ProgramUji::class, 'id_pcanalisa', 'id_pcanalisa');
    }

    public function dataHasilUji(): HasMany
    {
        return $this->hasMany(DataHasilUji::class, 'id_pcanalisa', 'id_pcanalisa');
    }

    public function kesimpulanUji(): HasMany
    {
        return $this->hasMany(KesimpulanlUji::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}
