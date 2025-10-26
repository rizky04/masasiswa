<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Pcanalisa; // pastikan modelnya sudah ada
use App\Models\Pcpar;     // untuk data parameter uji

class DomPdfController extends Controller
{
    public function previewLHU($path)
    {
        // 🔹 Ubah slash jadi dash agar aman
        $nopcanalisa = str_replace('/', '-', $path);

        // 🔹 Ambil data utama dari database
        $analisa = Pcanalisa::with(['pc', 'pcpar'])
            ->where('nopcanalisa', str_replace('-', '/', $nopcanalisa))
            ->first();
        

        if (!$analisa) {
            abort(404, 'Data analisa tidak ditemukan.');
        }

        // 🔹 Kirim data ke view PDF
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

        $pdf = Pdf::loadView('pdf.lhu', $data);

        return $pdf->stream("LHU_{$nopcanalisa}.pdf");
    }
}
