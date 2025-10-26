<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ContohUji extends Model
{
    //
    protected $fillable = ['contoh_uji', 'image', 'id_pcanalisa'];

    /**
     * Get the user that owns the ContohUji
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function pcanalisa(): BelongsTo
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}
