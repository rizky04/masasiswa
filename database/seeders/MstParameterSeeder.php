<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MstParameter;

class MstParameterSeeder extends Seeder
{
    public function run(): void
    {
        $data = [
            [
                'kode_parameter' => 'PRM001',
                'nama_parameter_in' => 'Kadar Air',
                'nama_parameter_en' => 'Moisture Content',
                'keterangan' => 'Menentukan kadar air dalam sampel produk',
            ],
            [
                'kode_parameter' => 'PRM002',
                'nama_parameter_in' => 'Kadar Abu',
                'nama_parameter_en' => 'Ash Content',
                'keterangan' => 'Menentukan kandungan abu pada produk',
            ],
            [
                'kode_parameter' => 'PRM003',
                'nama_parameter_in' => 'pH Larutan',
                'nama_parameter_en' => 'Solution pH',
                'keterangan' => 'Menentukan tingkat keasaman atau kebasaan larutan',
            ],
        ];

        foreach ($data as $item) {
            MstParameter::create($item);
        }
    }
}
