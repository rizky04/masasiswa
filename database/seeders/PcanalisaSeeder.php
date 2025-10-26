<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Pcanalisa;

class PcanalisaSeeder extends Seeder
{
    public function run(): void
    {
        Pcanalisa::create([
            'id_pc' => 1,
            'id_standar_uji' => 1,
            'nopcanalisa' => '0882/KMN/2024',
            'layanan_cepat' => 'normal',
            'spm' => 10,
            'tgl_perkiraan_analisaselesai' => '2024-08-24',
            'jenis_analisa' => 'paket',
            'status' => 'Diproses',
        ]);
    }
}
