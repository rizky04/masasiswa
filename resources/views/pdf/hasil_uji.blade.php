<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ $title }}</title>
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
        td, th { vertical-align: top; padding: 3px 5px; border: 1px solid #000; }
        td:first-child, th:first-child { width: 5%; text-align:center; }
        .page-break { page-break-before: always; }
        .section-title { font-weight: bold; margin-top: 15px; }
        .indent { text-indent: 30px; margin-bottom: 10px; }
        img.sample-img { max-width:150px; margin-top:5px; }
    </style>
</head>
<body>
    <img src="{{ public_path('images/watermark.png') }}" class="watermark" alt="Watermark">

    <main>
        <h1>LAPORAN HASIL UJI</h1>
        <table>
            <tr><td>Tanggal Laporan</td><td>: {{ $tanggal_laporan }}</td></tr>
            <tr><td>Nomor Analisa</td><td>: {{ $nopcanalisa }}</td></tr>
            <tr><td>Nama Pemohon</td><td>: {{ $pemohon }}</td></tr>
            <tr><td>Alamat</td><td>: {{ $alamat }}</td></tr>
            <tr><td>Alamat Pabrik</td><td>: {{ $alamat_pabrik }}</td></tr>
            <tr><td>Nama Contoh</td><td>: {{ $nama_contoh }}</td></tr>
            <tr><td>Tanggal Penerimaan Contoh</td><td>: {{ $tgl_terima }}</td></tr>
            <tr><td>Tanggal Pengujian</td><td>: {{ $tgl_uji }}</td></tr>
        </table>

        <div class="page-break"></div>
        <h1>1. Contoh Uji</h1>
        <p>{!! $contoh_uji !!}</p>
        @if($gambar_contoh)
            <img src="{{ public_path($gambar_contoh) }}" class="sample-img" alt="Gambar Contoh">
        @endif

        <div class="page-break"></div>
        <h1>2. Data Teknis Kemasan</h1>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Subject</th>
                    <th>Content</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data_teknis_kemasan as $i => $item)
                <tr>
                    <td>{{ $i+1 }}</td>
                    <td>{!! $item->subject_teknis_kemasan !!}</td>
                    <td>{!! $item->nama_teknis_kemasan !!}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <h1>3. Data Teknis Identifikasi</h1>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Teknis</th>
                    <th>Subject</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data_teknis_identifikasi as $i => $item)
                <tr>
                    <td>{{ $i+1 }}</td>!!
                    <td>{!! $item->nama_teknis_identifikasi !!}</td>
                    <td>{!! $item->subject_teknis_identifikasi !!}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="page-break"></div>
        <h1>4. Program Uji</h1>
        @foreach ($program_uji as $i => $pu)
        <div class="section-title">{{ $i+1 }}. {{ $pu->jenis_program_uji }} - {{ $pu->nama_program_uji }}</div>
        <p>{!! $pu->subject_program_uji !!}</p>
        @endforeach

        <div class="page-break"></div>
        <h1>5. Hasil Uji</h1>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Jenis Program Uji</th>
                    <th>Nama Hasil Uji</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($hasil_uji as $i => $h)
                <tr>
                    <td>{{ $i+1 }}</td>
                    <td>{{ $h->jenis_program_uji }}</td>
                    <td>{{ $h->nama_hasil_uji }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="page-break"></div>
        <h1>6. Kesimpulan Uji</h1>
        <p>{!! $kesimpulan !!}</p>

        <div style="text-align:right; margin-top:50px;">
            <strong>Manajer Teknis Aneka Kemasan, Produk dan Bahan</strong><br><br>
            <em>Dokumen ini ditandatangani secara elektronik oleh:</em><br><br>
            <strong>Roni Cristiono</strong>
        </div>
    </main>
</body>
</html>
