<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Pc;

class PcSeeder extends Seeder
{
    public function run(): void
    {
        Pc::create([
            'id_mst_laboratorium' => 1,
            'no_order' => 'SERT-0882/KMN/2024',
            'tgl_order' => '2024-08-09',
            'lama_order' => 14,
            'banyak_contoh' => 3,
            'tujuan_pengujian' => 'Sertifikasi mutu kemasan plastik',
            'tujuan_pengujian_ket' => 'Permintaan uji performa jerigen 20L NMC',
            'bahasa_lhu' => 'indonesia',
            'tgl_samplingmulai' => '2024-08-10',
            'tgl_samplingselesai' => '2024-08-11',
            'nomor_bapc' => 'BAPC/0882/KMN/2024',
            'keterangan_tambahan' => 'Contoh diambil langsung dari pabrik NMC',
            'badanusaha_customerdn' => 'PT',
            'nama_customer' => 'PT Kadujaya Perkasa',
            'alamat_customer' => 'Jl. Industri Raya No. 88, Cikarang, Jawa Barat',
            'alamatpabrik_customer' => 'Kawasan Industri Jababeka',
            'nip_input' => '198701012023011001',
            'tgl_input' => now(),
        ]);
    }
}
