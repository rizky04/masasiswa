<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\HasilUji;

class HasilUjiSeeder extends Seeder
{
    public function run(): void
    {
        HasilUji::create([
            'id_pcpar' => 1,
            'hasil_uji_in' => '12.5',
            'satuan_in' => 'mg/L',
            'tgl_input' => now(),
        ]);
    }
}
