<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    // =============================
    // DASHBOARD UNTUK ANALIS
    // =============================
    public function analis()
    {
        $user = Auth::user();
        return view('dashboard.analis', compact('user'));
    }

    // Halaman Data Analisa (tabel muncul di sini)
    public function dataAnalisa()
    {
        $user = Auth::user();

        // ✅ Ambil data dari tabel 'pc' beserta relasinya ke pcanalisa dan pcpar
        $data = \App\Models\Pc::with(['pcanalisa.pcpar'])
            ->orderBy('tgl_order', 'desc')
            ->get();

        // ✅ Kirim data ke view
        return view('analis.data_analisa', compact('user', 'data'));
    }

    // =============================
    // DASHBOARD UNTUK KORLAB
    // =============================
    public function korlab()
    {
        $user = Auth::user();
        return view('dashboard.korlab', compact('user'));
    }

    // Halaman Data korlab (tabel muncul di sini)
    public function dataValidasi()
    {
        $user = Auth::user();

        // ✅ Ambil data lengkap untuk korlab
        $data = \App\Models\Pc::with(['pcanalisa.pcpar.hasiluji'])
            ->orderBy('tgl_order', 'desc')
            ->get();

        return view('korlab.data-validasi', compact('user', 'data'));
    }


    // =============================
    // DASHBOARD UNTUK MANAJER
    // =============================
    public function manajer()
    {
        $user = Auth::user();
        return view('dashboard.manajer', compact('user'));
    }


    // 🔹 Halaman Validasi LHU khusus manajer
    public function validasiLHU()
    {
        $user = Auth::user();

        // ✅ Ambil semua data PC beserta relasi lengkap (pcanalisa → pcpar → hasiluji)
        $data = \App\Models\Pc::with(['pcanalisa.pcpar.hasiluji'])
            ->orderBy('tgl_order', 'desc')
            ->get();

        return view('manajer.validasi-lhu', compact('user', 'data'));
    }
}
