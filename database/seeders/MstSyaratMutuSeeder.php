<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MstSyaratMutu;

class MstSyaratMutuSeeder extends Seeder
{
    public function run(): void
    {
        MstSyaratMutu::insert([
            ['kode_syarat' => 'SM001', 'nama_syarat' => 'Sesuai Baku Mutu SNI', 'created_at' => now(), 'updated_at' => now()],
            ['kode_syarat' => 'SM002', 'nama_syarat' => 'Sesuai ISO 17025', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
