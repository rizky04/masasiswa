<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstParameter extends Model
{
    use HasFactory;

    protected $table = 'mst_parameter';
    protected $primaryKey = 'id';
    protected $fillable = [
        'kode_parameter',
        'nama_parameter_in',
        'nama_parameter_en',
        'keterangan'
    ];

    // Relasi ke Pcpar
    public function pcpar()
    {
        return $this->hasMany(Pcpar::class, 'id_parameter');
    }
}
