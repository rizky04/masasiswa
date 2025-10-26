<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DataHasilUji extends Model
{
    //
    protected $fillable = ['nama_hasil_uji', 'jenis_program_uji', 'id_pcanalisa'];

    /**
     * Get the user that owns the DataHasilUji
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
     public function pcanalisa(): BelongsTo
    {
        return $this->belongsTo(Pcanalisa::class, 'id_pcanalisa', 'id_pcanalisa');
    }
}
