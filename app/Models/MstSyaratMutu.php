<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstSyaratMutu extends Model
{
    use HasFactory;

    protected $table = 'mst_syarat_mutu';
    protected $primaryKey = 'id';
    protected $fillable = [
        'kode_syarat',
        'nama_syarat'
    ];

    // Relasi ke Pcpar
    public function pcpar()
    {
        return $this->hasMany(Pcpar::class, 'id_syarat_mutu');
    }
}
