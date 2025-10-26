<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>{{ $data['title'] ?? 'Laporan Hasil Uji' }}</title>
    <style>
        @page { margin: 0cm; }
        body { font-family: DejaVu Sans, sans-serif; margin: 3.5cm 2cm 2.5cm 2cm; position: relative; }
        header { position: fixed; top: 0cm; left: 0cm; right: 0cm; height: 3cm; }
        header img { width: 100%; height: auto; }
        .watermark { position: fixed; top: 1%; left: 2%; width: 95%; z-index: -1; }
        footer { position: fixed; bottom: 0cm; left: 0cm; right: 0cm; height: 2cm; text-align: center; font-size: 10px; color: #666; }
        main { position: relative; z-index: 1; }
        h1 { text-align: center; font-size: 16pt; font-weight: bold; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; font-size: 12pt; }
        td { vertical-align: top; padding: 3px 5px; }
        td:first-child { width: 30%; }
        .page-break { page-break-before: always; }
    </style>
</head>

<body>
    <img src="{{ public_path('images/watermark.png') }}" class="watermark" alt="Watermark">

    <main>
        <h1>LAPORAN HASIL UJI</h1>
        <table>
            <tr>
                <td>Tanggal Laporan</td>
                <td>: {{ $data['tanggal_laporan'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Nomor Analisa</td>
                <td>: {{ $data['nopcanalisa'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Nama Pemohon</td>
                <td>: {{ $data['pemohon'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Alamat</td>
                <td>: {{ $data['alamat'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Alamat Pabrik</td>
                <td>: {{ $data['alamat_pabrik'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Nama Contoh</td>
                <td>: {{ $analisa->contohUji->contoh_uji ?? $data['nama_contoh'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Tanggal Penerimaan Contoh</td>
                <td>: {{ $data['tgl_terima'] ?? '-' }}</td>
            </tr>
            <tr>
                <td>Tanggal Pengujian</td>
                <td>: {{ $data['tgl_uji'] ?? '-' }}</td>
            </tr>
        </table>

        {{-- Halaman 2 --}}
        <div class="page-break"></div>
        <h1>HASIL UJI</h1>
        <div class="section-title">1. Contoh Uji</div>
        <p>
            {{ $analisa->contohUji->contoh_uji ?? $data['nama_contoh'] ?? '-' }}
        </p>

        <div class="section-title">2. Data Teknis</div>
        <table border="1" cellpadding="3">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Parameter</th>
                    <th>Satuan</th>
                    <th>Hasil</th>
                    <th>Syarat Mutu</th>
                </tr>
            </thead>
            <tbody>
                @foreach($data['parameter'] ?? [] as $i => $par)
                <tr>
                    <td style="text-align:center;">{{ $i + 1 }}</td>
                    <td>{{ $par->parameter->nama_parameter ?? '-' }}</td>
                    <td style="text-align:center;">{{ $par->satuan ?? '-' }}</td>
                    <td style="text-align:center;">{{ $par->hasil ?? '-' }}</td>
                    <td style="text-align:center;">{{ $par->syarat_mutu ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        {{-- Halaman 3 --}}
        <div class="page-break"></div>
        <h1>PROGRAM UJI</h1>
        <table border="1" cellpadding="3">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Jenis Program Uji</th>
                    <th>Nama Program Uji</th>
                    <th>Subject Program Uji</th>
                </tr>
            </thead>
            <tbody>
                @foreach($analisa->programUji ?? [] as $i => $prog)
                <tr>
                    <td style="text-align:center;">{{ $i + 1 }}</td>
                    <td>{{ $prog->jenis_program_uji ?? '-' }}</td>
                    <td>{{ $prog->nama_program_uji ?? '-' }}</td>
                    <td>{{ $prog->subject_program_uji ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        {{-- Halaman 4 --}}
        <div class="page-break"></div>
        <h1>HASIL UJI</h1>
        <table border="1" cellpadding="3">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Hasil Uji</th>
                    <th>Jenis Program</th>
                </tr>
            </thead>
            <tbody>
                @foreach($analisa->dataHasilUji ?? [] as $i => $hasil)
                <tr>
                    <td style="text-align:center;">{{ $i + 1 }}</td>
                    <td>{{ $hasil->nama_hasil_uji ?? '-' }}</td>
                    <td>{{ $hasil->jenis_program_uji ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        {{-- Kesimpulan --}}
        <div class="page-break"></div>
        <h1>KESIMPULAN</h1>
        <p>
            {{ $analisa->kesimpulanUji->first()->kesimpulan_uji ?? '-' }}
        </p>

        <br><br>
        <div style="text-align:right; margin-top:50px;">
            <strong>Manajer Teknis Aneka Kemasan, Produk dan Bahan</strong><br><br>
            <em>Dokumen ini ditandatangani secara elektronik oleh:</em><br><br>
            <strong>Roni Cristiono</strong>
        </div>
    </main>
</body>

</html>
