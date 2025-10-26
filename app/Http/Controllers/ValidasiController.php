<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pcanalisa;

class ValidasiController extends Controller
{
    public function updateStatus(Request $request)
    {
        $id = $request->id;
        $aksi = $request->aksi;

        $pcanalisa = Pcanalisa::find($id);
        if (!$pcanalisa) {
            return response()->json(['success' => false, 'message' => 'Data tidak ditemukan']);
        }

        // 🔹 Logika perpindahan status
        switch ($aksi) {
            case 'validasi':
                if ($pcanalisa->status_validasi === 'analis') {
                    $pcanalisa->status_validasi = 'korlab';
                } elseif ($pcanalisa->status_validasi === 'korlab') {
                    $pcanalisa->status_validasi = 'manajer';
                } elseif ($pcanalisa->status_validasi === 'manajer') {
                    $pcanalisa->status_validasi = 'final';
                }
                break;

            case 'tolak':
                $pcanalisa->status_validasi = 'analis';
                break;
        }

        $pcanalisa->save();

        return response()->json([
            'success' => true,
            'status' => $pcanalisa->status_validasi,
        ]);
    }
}
