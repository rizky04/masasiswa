<?php

namespace Database\Seeders; // ✅ WAJIB ditambahkan di baris kedua

use Illuminate\Database\Seeder;
use App\Models\MstProduk;

class MstProdukSeeder extends Seeder
{
    public function run(): void
    {
        MstProduk::create([
            'kode_produk' => 'PRD001',
            'nama_produk' => 'Minyak Cengkeh',
            'deskripsi' => 'Produk bahan alam untuk uji mutu minyak atsiri',
        ]);

        MstProduk::create([
            'kode_produk' => 'PRD002',
            'nama_produk' => 'Kapsul Herbal',
            'deskripsi' => 'Produk sediaan farmasi herbal untuk uji standar mutu',
        ]);
    }
}
