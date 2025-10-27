<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>{{ $data['title'] ?? 'Laporan Hasil Uji' }}</title>
    <style>
        @page {
            size: A4;
            margin: 0cm;
        }

        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 4cm 2cm 2.5cm 2cm;
            position: relative;
            line-height: 1.4;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 3cm;
        }

        header img {
            width: 100%;
            height: auto;
        }

        .watermark {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.08;
            z-index: -1;
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2cm;
            text-align: center;
            font-size: 10px;
            color: #666;
        }

        main {
            position: relative;
            z-index: 1;
            margin-top: 0.5cm;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        h1 {
            text-align: center;
            font-size: 16pt;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* ===== TABEL TANPA GARIS, RAPI SEMUA KASUS ===== */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 6px;
            font-size: 12pt;
            margin-bottom: 12px;
            table-layout: fixed; /* jaga lebar kolom tetap */
        }

        td {
            padding: 6px 8px;
            vertical-align: middle;
            word-wrap: break-word;
        }

        /* Untuk tabel 2 kolom */
        table.two-cols td:first-child {
            width: 40%;
            font-weight: 500;
        }
        table.two-cols td:last-child {
            width: 60%;
        }

        /* Untuk tabel 3 kolom */
        table.three-cols td:nth-child(1) {
            width: 30%;
        }
        table.three-cols td:nth-child(2),
        table.three-cols td:nth-child(3) {
            width: 35%;
        }

        /* Untuk tabel 4 kolom */
        table.four-cols td {
            width: 25%;
        }

        .page-break {
            page-break-before: always;
        }

        .section-title {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 5px;
        }
    </style>
</head>

<body>
    <header>
        {{-- <img src="{{ public_path('images/header.png') }}" alt="Header"> --}}
    </header>

    <img src="{{ public_path('images/watermark.png') }}" class="watermark" alt="Watermark">

    <main>
        <h1>LAPORAN HASIL UJI</h1>

        <!-- 2 kolom -->
        <table class="two-cols">
            <tr><td>Tanggal Laporan</td><td>: {{ $data['tanggal_laporan'] ?? '-' }}</td></tr>
            <tr><td>Nomor Analisa</td><td>: {{ $data['nopcanalisa'] ?? '-' }}</td></tr>
            <tr><td>Nama Pemohon</td><td>: {{ $data['pemohon'] ?? '-' }}</td></tr>
            <tr><td>Alamat</td><td>: {{ $data['alamat'] ?? '-' }}</td></tr>
            <tr><td>Alamat Pabrik</td><td>: {{ $data['alamat_pabrik'] ?? '-' }}</td></tr>
            <tr><td>Nama Contoh</td><td>: {!! $analisa->contohUji->contoh_uji ?? $data['nama_contoh'] ?? '-' !!}</td></tr>
            <tr><td>Tanggal Penerimaan Contoh</td><td>: {{ $data['tgl_terima'] ?? '-' }}</td></tr>
            <tr><td>Tanggal Pengujian</td><td>: {{ $data['tgl_uji'] ?? '-' }}</td></tr>
        </table>

        <div class="page-break"></div>
        <h1>HASIL UJI</h1>

        <div class="section-title">1. Contoh Uji</div>
        @if($analisa->contohUji)
            <div class="mb-3 p-3 border rounded bg-light">
                <p>{!! nl2br($analisa->contohUji->contoh_uji) !!}</p>
                @if($analisa->contohUji->image)
                    <img src="{{ public_path($analisa->contohUji->image) }}" alt="Contoh Uji" height="200" width="200">
                @endif
            </div>
        @else
            <p>-</p>
        @endif

        <div class="section-title">2. Data Teknis <br>A. Uji Kemasan</div>
        <h1>Hasil Uji</h1>
        @if($analisa->dataTeknisKemasan)
            <table class="three-cols">
                <tbody>
                    @foreach($analisa->dataTeknisKemasan ?? [] as $i => $prog)
                    <tr>
                        <td style="text-align:center;">{{ $i + 1 }}</td>
                        <td>{!! $prog->nama_teknis_kemasan ?? '-' !!}</td>
                        <td>{!! $prog->subject_teknis_kemasan ?? '-' !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <h1>Hasil Uji</h1>
        <div class="section-title">B. Data Teknik Identifikasi</div>
        @if($analisa->dataTeknisIdentifikasi)
            <table class="two-cols">
                <tbody>
                    @foreach($analisa->dataTeknisIdentifikasi ?? [] as $i => $prog)
                    <tr>
                        <td>{!! $prog->nama_teknis_identifikasi ?? '-' !!}</td>
                        <td>{!! $prog->subject_teknis_identifikasi ?? '-' !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <h1>Hasil Uji</h1>
        <div class="section-title">3. Data Program Uji</div>
        <table class="three-cols">
            <tbody>
                @foreach($analisa->programUji ?? [] as $i => $prog)
                <tr>
                    <td>{{ $prog->jenis_program_uji ?? '-' }}</td>
                    <td>{{ $prog->nama_program_uji ?? '-' }}</td>
                    <td>{!! $prog->subject_program_uji ?? '-' !!}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <h1>Hasil Uji</h1>
        <div class="section-title">4. Data Hasil Uji</div>
        <table class="two-cols">
            <tbody>
                @foreach($analisa->dataHasilUji ?? [] as $i => $hasil)
                <tr>
                    <td>{{ $hasil->jenis_program_uji ?? '-' }}</td>
                    <td>{{ $hasil->nama_hasil_uji ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <h1>Hasil Uji</h1>
        <div class="section-title">5. Kesimpulan</div>
        <p>{!! $analisa->kesimpulanUji->first()->kesimpulan_uji ?? '-' !!}</p>

        <br><br>
        <div style="text-align:right; margin-top:50px;">
            <strong>Manajer Teknis Aneka Kemasan, Produk dan Bahan</strong><br><br>
            <em>Dokumen ini ditandatangani secara elektronik oleh:</em><br><br>
            <strong>Roni Cristiono</strong>
        </div>
    </main>

    <footer></footer>
</body>

</html>
