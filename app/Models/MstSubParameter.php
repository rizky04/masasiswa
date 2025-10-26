<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstSubParameter extends Model
{
    use HasFactory;

    protected $table = 'mst_sub_parameter';
    protected $primaryKey = 'id';
    protected $fillable = [
        'kode_sub',
        'nama_sub'
    ];

    // Relasi ke Pcpar
    public function pcpar()
    {
        return $this->hasMany(Pcpar::class, 'id_sub_parameter');
    }
}
