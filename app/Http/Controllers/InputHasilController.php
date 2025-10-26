<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pcanalisa;
use App\Models\Pcpar;

class InputHasilController extends Controller
{
    public function show($id)
    {
        $analisa = Pcanalisa::with(['produk', 'pcpar.parameter'])
            ->where('id_pcanalisa', $id)
            ->firstOrFail();

        return view('analis.input-hasil', compact('analisa'));
    }

    public function update(Request $request)
    {
        foreach ($request->hasil as $id_pcpar => $hasil) {
            $pcpar = Pcpar::find($id_pcpar);
            $pcpar->hasil = $hasil;
            $pcpar->save();
        }

        return redirect()->back()->with('success', 'Hasil uji berhasil diperbarui!');
    }
}
