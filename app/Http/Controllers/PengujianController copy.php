<?php

namespace App\Http\Controllers;

use App\Models\Pengujian;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class PengujianController extends Controller
{
    /**
     * Tampilkan semua data pengujian.
     */
    public function index()
    {
        $pengujian = Pengujian::all();
        return view('pengujian.index', compact('pengujian'));
    }

    /**
     * Form tambah data.
     */
    public function create()
    {
        return view('pengujian.create');
    }

    /**
     * Simpan data baru.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'contoh_uji'   => 'nullable|string',
            'data_teknis'  => 'nullable|string',
            'program_uji'  => 'nullable|string',
            'hasil_uji'    => 'nullable|string',
            'kesimpulan'   => 'nullable|string',
            'foto'         => 'nullable|file|image|max:2048',
        ]);

        // Upload foto ke folder public/uploads/pengujian/
        if ($request->hasFile('foto')) {
            $foto      = $request->file('foto');
            $namaFoto  = time() . '_' . $foto->getClientOriginalName();
            $tujuan    = public_path('uploads/pengujian');
            $foto->move($tujuan, $namaFoto);
            $validated['foto'] = 'uploads/pengujian/' . $namaFoto;
        }

        Pengujian::create($validated);

        return redirect()->route('pengujian.index')->with('success', 'Data pengujian berhasil disimpan!');
    }

    /**
     * Form edit data.
     */
    public function edit($id)
    {
        $pengujian = Pengujian::findOrFail($id);
        return view('pengujian.edit', compact('pengujian'));
    }

    /**
     * Update data.
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'contoh_uji'   => 'nullable|string',
            'data_teknis'  => 'nullable|string',
            'program_uji'  => 'nullable|string',
            'hasil_uji'    => 'nullable|string',
            'kesimpulan'   => 'nullable|string',
            'foto'         => 'nullable|file|image|max:2048',
        ]);

        $pengujian = Pengujian::findOrFail($id);

        // Upload foto baru jika ada
        if ($request->hasFile('foto')) {
            $foto      = $request->file('foto');
            $namaFoto  = time() . '_' . $foto->getClientOriginalName();
            $tujuan    = public_path('uploads/pengujian');
            $foto->move($tujuan, $namaFoto);
            $validated['foto'] = 'uploads/pengujian/' . $namaFoto;
        }

        $pengujian->update($validated);

        return redirect()->route('pengujian.index')->with('success', 'Data pengujian berhasil diperbarui!');
    }

    /**
     * Hapus data.
     */
    public function destroy($id)
    {
        $pengujian = Pengujian::findOrFail($id);

        // Hapus file foto dari folder jika ada
        if ($pengujian->foto && file_exists(public_path($pengujian->foto))) {
            unlink(public_path($pengujian->foto));
        }

        $pengujian->delete();

        return redirect()->route('pengujian.index')->with('success', 'Data pengujian berhasil dihapus!');
    }



public function pdf($id)
{
    $pengujian = Pengujian::findOrFail($id);
    $pdf = Pdf::loadView('pengujian.pdf', compact('pengujian'))
        ->setPaper('a4', 'portrait');

    return $pdf->stream('pengujian_'.$pengujian->id.'.pdf');
}

}
