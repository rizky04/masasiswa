<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MstLaboratorium;

class MstLaboratoriumSeeder extends Seeder
{
    public function run(): void
    {
        MstLaboratorium::create([
            'nama_laboratorium' => 'Laboratorium Bahan dan Produk',
            'kode_lab' => 'BHP',
            'keterangan' => 'Laboratorium pengujian kemasan dan bahan plastik',
        ]);
    }
}
