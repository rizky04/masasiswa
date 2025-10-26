<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstProduk extends Model
{
    use HasFactory;

    protected $table = 'mst_produk';
    protected $primaryKey = 'id';
    protected $fillable = [
        'kode_produk',
        'nama_produk',
        'deskripsi'
    ];

    // Relasi ke Pcpar (1 produk bisa muncul di banyak parameter uji)
    public function pcpar()
    {
        return $this->hasMany(Pcpar::class, 'id_produk');
    }

    // Relasi ke Pcanalisa (1 produk bisa muncul di banyak analisa)
    public function pcanalisa()
    {
        return $this->hasMany(Pcanalisa::class, 'id_produk');
    }
}
