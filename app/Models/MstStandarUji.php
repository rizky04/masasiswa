<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstStandarUji extends Model
{
    use HasFactory;

    protected $table = 'mst_standar_uji';
    protected $primaryKey = 'id';
    protected $fillable = [
        'kode_standar',
        'nama_standar',
        'keterangan'
    ];

    // Relasi ke Pcanalisa (1 standar uji bisa dipakai banyak analisa)
    public function pcanalisa()
    {
        return $this->hasMany(Pcanalisa::class, 'id_standar_uji');
    }
}
