<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MstStandarUji;

class MstStandarUjiSeeder extends Seeder
{
    public function run(): void
    {
        MstStandarUji::create([
            'nama_standar' => 'SNI 1234:2020',
            'keterangan' => 'Standar uji mutu bahan dan produk kimia', // ✅ ubah ke nama kolom di migrasi
        ]);
    }
}
