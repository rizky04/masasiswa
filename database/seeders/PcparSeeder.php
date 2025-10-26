<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Pcpar;
use App\Models\MstParameter;
use App\Models\Pcanalisa;
use App\Models\MstProduk;

class PcparSeeder extends Seeder
{
    public function run(): void
    {
        if (MstParameter::exists() && Pcanalisa::exists() && MstProduk::exists()) {
            Pcpar::create([
                'id_pcanalisa' => Pcanalisa::first()->id_pcanalisa,
                'id_produk' => MstProduk::first()->id,
                'id_parameter' => MstParameter::first()->id,
                'jenispcpar' => 'parameter',
                'hargasatuan' => 250000,
                'satuan_in' => '1x Uji',
            ]);
        } else {
            echo "⚠️ Data parent belum ada. Jalankan MstParameterSeeder, PcanalisaSeeder, dan MstProdukSeeder dulu.\n";
        }
    }
}
