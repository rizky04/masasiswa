<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MstProduk;
use PDF; // pastikan diimport

class ReportController extends Controller
{
    // 🔹 Tampilkan preview di browser
    public function previewProduk()
    {
        $produk = MstProduk::all(); // ambil semua data dari tabel
        return view('laporan.produk', compact('produk'));
    }

    // 🔹 Export ke PDF
    public function downloadProdukPDF()
    {
        $produk = MstProduk::all();
        $pdf = PDF::loadView('laporan.produk_pdf', compact('produk'));
        return $pdf->download('Laporan_Produk.pdf');
    }
}
