<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MstSubParameter;

class MstSubParameterSeeder extends Seeder
{
    public function run(): void
    {
        MstSubParameter::insert([
            ['kode_sub' => 'SP001', 'nama_sub' => 'Migrasi Logam Berat', 'created_at' => now(), 'updated_at' => now()],
            ['kode_sub' => 'SP002', 'nama_sub' => 'Migrasi Total', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
