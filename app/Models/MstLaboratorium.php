<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstLaboratorium extends Model
{
    use HasFactory;

    protected $table = 'mst_laboratorium';
    protected $primaryKey = 'id';
    protected $fillable = ['nama_laboratorium'];

    public function pcs()
    {
        return $this->hasMany(Pc::class, 'id_mst_laboratorium');
    }
}