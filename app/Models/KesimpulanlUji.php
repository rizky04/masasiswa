<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


class KesimpulanlUji extends Model
{
    protected $fillable = ['kesimpulan_uji', 'id_pcanalisa'];

        public function pcanalisa(): BelongsTo
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}

