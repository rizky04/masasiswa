<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContohUji;
use App\Models\DataTeknisKemasan;
use App\Models\DataTeknisIdentifikasi;
use App\Models\ProgramUji;
use App\Models\DataHasilUji;
use App\Models\KesimpulanlUji;
use App\Models\Pcanalisa;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Barryvdh\DomPDF\Facade\Pdf; // pastikan sudah install barryvdh/laravel-dompdf


class PengujianController extends Controller
{
    public function store(Request $request)
    {

        // dd($request->all());
        // ==========================
        // VALIDASI
        // ==========================
        $validated = $request->validate([
            'id_pcanalisa' => 'required|exists:pcanalisa,id_pcanalisa',
            'contoh_uji' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'subject_uji.*' => 'nullable|string',
            'content_uji.*' => 'nullable|string',
            'nama_teknis_identifikasi.*' => 'nullable|string',
            'subject_teknis_identifikasi.*' => 'nullable|string',
            'nama_program_uji.*' => 'nullable|string',
            'subject_program_uji.*' => 'nullable|string',
            'jenis_program_uji.*' => 'nullable|string',
            'nama_hasil_uji.*' => 'nullable|string',
            'jenis_program_uji_hasil.*' => 'nullable|string', // supaya beda dengan program uji
            'kesimpulan_uji' => 'nullable|string',
        ]);

        DB::beginTransaction();
        try {
            $id_pcanalisa = $validated['id_pcanalisa'];

            // ==========================
            // 1. Contoh Uji
            // ==========================
            // $imagePath = null;
            // if($request->hasFile('image')) {
            //     $file = $request->file('image');
            //     $imageName = Str::slug(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME))
            //                  .'-'.time().'.'.$file->getClientOriginalExtension();
            //     $imagePath = $file->storeAs('public/contoh_uji', $imageName);
            // }
              if ($request->hasFile('image')) {
            $image      = $request->file('image');
            $namaFoto  = time() . '_' . $image->getClientOriginalName();
            $tujuan    = public_path('uploads/pengujian');
            $image->move($tujuan, $namaFoto);
            $validated['image'] = 'uploads/pengujian/' . $namaFoto;
        }

            ContohUji::create([
                'contoh_uji' => $validated['contoh_uji'],
                'image' => $validated['image'],
                'id_pcanalisa' => $id_pcanalisa,
            ]);

            // ==========================
            // 2. Data Teknis Kemasan
            // ==========================
            if($request->has('subject_uji')) {
                foreach($request->subject_uji as $key => $subject) {
                    DataTeknisKemasan::create([
                        'subject_teknis_kemasan' => $subject,
                        'nama_teknis_kemasan' => $request->content_uji[$key] ?? null,
                        'id_pcanalisa' => $id_pcanalisa,
                    ]);
                }
            }

            // ==========================
            // 3. Data Teknis Identifikasi
            // ==========================
            if($request->has('nama_teknis_identifikasi')) {
                foreach($request->nama_teknis_identifikasi as $key => $nama) {
                    DataTeknisIdentifikasi::create([
                        'nama_teknis_identifikasi' => $nama,
                        'subject_teknis_identifikasi' => $request->subject_teknis_identifikasi[$key] ?? null,
                        'id_pcanalisa' => $id_pcanalisa,
                    ]);
                }
            }

            // ==========================
            // 4. Program Uji
            // ==========================
            if($request->has('nama_program_uji')) {
                foreach($request->nama_program_uji as $key => $nama) {
                    ProgramUji::create([
                        'nama_program_uji' => $nama,
                        'subject_program_uji' => $request->subject_program_uji[$key] ?? null,
                        'jenis_program_uji' => $request->jenis_program_uji[$key] ?? null,
                        'id_pcanalisa' => $id_pcanalisa,
                    ]);
                }
            }

            // ==========================
            // 5. Hasil Uji
            // ==========================
            if($request->has('nama_hasil_uji')) {
                foreach($request->nama_hasil_uji as $key => $nama) {
                    DataHasilUji::create([
                        'nama_hasil_uji' => $nama,
                        'jenis_program_uji' => $request->jenis_program_uji_hasil[$key] ?? null,
                        'id_pcanalisa' => $id_pcanalisa,
                    ]);
                }
            }

            // ==========================
            // 6. Kesimpulan
            // ==========================
            if($request->filled('kesimpulan_uji')) {
                KesimpulanlUji::create([
                    'kesimpulan_uji' => $request->kesimpulan_uji,
                    'id_pcanalisa' => $id_pcanalisa,
                ]);
            }

            DB::commit();

            return response()->json([
                'status' => 'success',
                'message' => 'Data berhasil disimpan'
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'status' => 'error',
                'message' => 'Gagal menyimpan data: '.$e->getMessage()
            ], 500);
        }
    }

     public function show($id)
    {
        // Ambil data analisa beserta relasi
        $analisa = Pcanalisa::with([
            'contohUji',
            'dataTeknisKemasan',
            'dataTeknisIdentifikasi',
            'programUji',
            'dataHasilUji',
            'kesimpulanUji'
        ])->findOrFail($id);

        // Return view show.blade.php
        return view('analis.show', compact('analisa'));
    }

    public function edit($id_pcanalisa)
{
    $analisa = Pcanalisa::with([
        'contohUji',
        'dataTeknisKemasan',
        'dataTeknisIdentifikasi',
        'programUji',
        'dataHasilUji',
        'kesimpulanUji'
    ])->findOrFail($id_pcanalisa);


    return view('analis.edit', compact('analisa'));
}


    public function update(Request $request, $id)
{
    $analisa = Pcanalisa::findOrFail($id);

    $validated = $request->validate([
        'id_pcanalisa' => 'required|exists:pcanalisa,id_pcanalisa',
        'contoh_uji' => 'required|string',
        'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        'subject_uji.*' => 'required|string',
        'content_uji.*' => 'nullable|string',
        'nama_teknis_identifikasi.*' => 'required|string',
        'subject_teknis_identifikasi.*' => 'nullable|string',
        'nama_program_uji.*' => 'required|string',
        'subject_program_uji.*' => 'nullable|string',
        'jenis_program_uji.*' => 'required|string',
        'nama_hasil_uji.*' => 'required|string',
        'jenis_program_uji_hasil.*' => 'required|string',
        'kesimpulan_uji' => 'nullable|string',
    ]);

    DB::beginTransaction();
    try {
        $id_pcanalisa = $validated['id_pcanalisa'];

        // 1. Update Contoh Uji
        $contoh = $analisa->contohUji;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $namaFoto = time() . '_' . $image->getClientOriginalName();
            $tujuan = public_path('uploads/pengujian');
            $image->move($tujuan, $namaFoto);
            $validated['image'] = 'uploads/pengujian/' . $namaFoto;
        }
        $contoh->update([
            'contoh_uji' => $validated['contoh_uji'],
            'image' => $validated['image'] ?? $contoh->image,
        ]);

        // 2. Update Data Teknis Kemasan
        $analisa->dataTeknisKemasan()->delete();
        if($request->has('subject_uji')){
            foreach($request->subject_uji as $key => $subject){
                DataTeknisKemasan::create([
                    'subject_teknis_kemasan' => $subject,
                    'nama_teknis_kemasan' => $request->content_uji[$key] ?? null,
                    'id_pcanalisa' => $id_pcanalisa,
                ]);
            }
        }

        // 3. Update Data Teknis Identifikasi
        $analisa->dataTeknisIdentifikasi()->delete();
        if($request->has('nama_teknis_identifikasi')){
            foreach($request->nama_teknis_identifikasi as $key => $nama){
                DataTeknisIdentifikasi::create([
                    'nama_teknis_identifikasi' => $nama,
                    'subject_teknis_identifikasi' => $request->subject_teknis_identifikasi[$key] ?? null,
                    'id_pcanalisa' => $id_pcanalisa,
                ]);
            }
        }

        // 4. Update Program Uji
        $analisa->programUji()->delete();
        if($request->has('nama_program_uji')){
            foreach($request->nama_program_uji as $key => $nama){
                ProgramUji::create([
                    'nama_program_uji' => $nama,
                    'subject_program_uji' => $request->subject_program_uji[$key] ?? null,
                    'jenis_program_uji' => $request->jenis_program_uji[$key] ?? null,
                    'id_pcanalisa' => $id_pcanalisa,
                ]);
            }
        }

        // 5. Update Hasil Uji
        $analisa->dataHasilUji()->delete();
        if($request->has('nama_hasil_uji')){
            foreach($request->nama_hasil_uji as $key => $nama){
                DataHasilUji::create([
                    'nama_hasil_uji' => $nama,
                    'jenis_program_uji' => $request->jenis_program_uji_hasil[$key] ?? null,
                    'id_pcanalisa' => $id_pcanalisa,
                ]);
            }
        }

        // 6. Update Kesimpulan
        $analisa->kesimpulanUji()->delete();
        if($request->filled('kesimpulan_uji')){
            KesimpulanlUji::create([
                'kesimpulan_uji' => $request->kesimpulan_uji,
                'id_pcanalisa' => $id_pcanalisa,
            ]);
        }

        DB::commit();
        return response()->json(['status'=>'success','message'=>'Data berhasil diperbarui']);
    } catch (\Exception $e) {
        DB::rollBack();
        return response()->json(['status'=>'error','message'=>'Gagal menyimpan data: '.$e->getMessage()],500);
    }
}



public function generatePdf($id)
{
    $analisa = Pcanalisa::with([
        'contohUji',
        'dataTeknisKemasan',
        'dataTeknisIdentifikasi',
        'programUji',
        'dataHasilUji',
        'kesimpulanUji'
    ])->findOrFail($id);

    $pdf = Pdf::loadView('pdf.hasil_uji', [
        'title' => 'Laporan Hasil Uji',
        'tanggal_laporan' => now()->format('d-m-Y'),
        'nopcanalisa' => $analisa->nopcanalisa,
        'pemohon' => $analisa->pemohon ?? '-',
        'alamat' => $analisa->alamat ?? '-',
        'alamat_pabrik' => $analisa->alamat_pabrik ?? '-',
        'nama_contoh' => $analisa->contohUji->contoh_uji ?? '-',
        'tgl_terima' => $analisa->tgl_terima ?? '-',
        'tgl_uji' => $analisa->tgl_pengujian ?? '-',
        'parameter' => $analisa->dataHasilUji
    ]);

    // Jangan pakai "/" atau "\" di nama file
    return $pdf->stream('laporan_hasil_'.$analisa->nopcanalisa.'.pdf');
}

public function pdf($id)
{
      $analisa = Pcanalisa::with([
        'contohUji',
        'dataTeknisKemasan',
        'dataTeknisIdentifikasi',
        'programUji',
        'dataHasilUji',
        'kesimpulanUji','pc', 'pcpar'
    ])->findOrFail($id);

    $data = [
        'title' => 'Laporan Hasil Uji (LHU)',
            'nopcanalisa' => $analisa->nopcanalisa,
            'tanggal_laporan' => $analisa->tgl_perkiraan_analisaselesai,
            'pemohon' => $analisa->pc->nama_customer ?? '-',
            'alamat' => $analisa->pc->alamat_customer ?? '-',
            'alamat_pabrik' => $analisa->pc->alamatpabrik_customer ?? '-',
            'nama_contoh' => $analisa->namasample_indo ?? '-',
            'tgl_terima' => $analisa->tgl_terima ?? '-',
            'tgl_uji' => $analisa->tgl_pengujian ?? '-',
            'parameter' => $analisa->pcpar, // daftar parameter uji
    ];
    $pdf = Pdf::loadView('pengujian.pdf', compact('analisa', 'data'))
        ->setPaper('a4', 'portrait');

    return $pdf->stream('pengujian_'.$analisa->id.'.pdf');
}

}
