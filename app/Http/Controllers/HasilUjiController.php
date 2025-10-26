<?php

namespace App\Http\Controllers;

use App\Models\Pc;
use Illuminate\Http\Request;

class HasilUjiController extends Controller
{
    public function index()
    {
        // Ambil data dari tabel 'pc' beserta relasinya
        $data = Pc::with(['pcanalisa.pcpar'])
            ->orderBy('tgl_order', 'desc')
            ->get();

        return view('hasil_uji.index', compact('data'));
    }
}
