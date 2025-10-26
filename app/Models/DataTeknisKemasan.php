<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DataTeknisKemasan extends Model
{
    //
     protected $fillable = ['nama_teknis_kemasan', 'subject_teknis_kemasan', 'id_pcanalisa'];
      public function pcanalisa(): BelongsTo
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}

