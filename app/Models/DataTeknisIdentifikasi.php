<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DataTeknisIdentifikasi extends Model
{
    //
    protected $fillable = ['nama_teknis_identifikasi', 'subject_teknis_identifikasi', 'id_pcanalisa'];
       public function pcanalisa(): BelongsTo
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}
