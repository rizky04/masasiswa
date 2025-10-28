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
            font-size: 12pt;
        }

        header {
            position: fixed;
            top: 0cm;
            left: 0cm;
            right: 0cm;
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
            z-index: -1;
        }

        footer {
            position: fixed;
            bottom: 0cm;
            left: 0cm;
            right: 0cm;
            height: 2cm;
            text-align: center;
            font-size: 10px;
            color: #666;
        }

        main {
            position: relative;
            z-index: 1;
            width: 90%;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            font-size: 16pt;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* ===== TABEL ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 18px;
        }

        th, td {
            border: 1px solid #000;
            padding: 6px 10px;
            vertical-align: top;
            text-align: left;
            white-space: pre-line;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .no-border td {
            border: none;
            padding: 4px 6px;
        }

        /* ===== SECTION ===== */
        .section-title {
            font-weight: bold;
            margin-top: 25px;
            margin-bottom: 8px;
            text-transform: uppercase;
            border-bottom: 1px solid #000;
            padding-bottom: 4px;
        }

        .page-break {
            page-break-before: always;
        }

        .signature {
            text-align: right;
            margin-top: 60px;
            line-height: 1.5;
        }

        .signature strong {
            display: block;
        }

        p {
            margin: 4px 0;
            text-align: justify;
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

        <table class="no-border">
            <tr><td>Tanggal Laporan</td><td>: {{ $data['tanggal_laporan'] ?? '-' }}</td></tr>
            <tr><td>Nomor Analisa</td><td>: {{ $data['nopcanalisa'] ?? '-' }}</td></tr>
            <tr><td>Nama Pemohon</td><td>: {{ $data['pemohon'] ?? '-' }}</td></tr>
            <tr><td>Alamat</td><td>: {{ $data['alamat'] ?? '-' }}</td></tr>
            <tr><td>Alamat Pabrik</td><td>: {{ $data['alamat_pabrik'] ?? '-' }}</td></tr>
            <tr>
                <td>Nama Contoh</td>
                <td style="white-space: pre-line;">: {{ strip_tags($analisa->contohUji->contoh_uji ?? $data['nama_contoh'] ?? '-') }}</td>
            </tr>
            <tr><td>Tanggal Penerimaan Contoh</td><td>: {{ $data['tgl_terima'] ?? '-' }}</td></tr>
            <tr><td>Tanggal Pengujian</td><td>: {{ $data['tgl_uji'] ?? '-' }}</td></tr>
        </table>

        <div class="page-break"></div>
        <h1>HASIL UJI</h1>

        <!-- 1. Contoh Uji -->
        <div class="section-title">1. Contoh Uji</div>
        @if($analisa->contohUji)
            <p>{!! nl2br(e($analisa->contohUji->contoh_uji)) !!}</p>
            @if($analisa->contohUji->image)
                <div style="text-align:center; margin-top:10px;">
                    <img src="{{ public_path($analisa->contohUji->image) }}" alt="Contoh Uji" height="200" width="200">
                </div>
            @endif
        @else
            <p>-</p>
        @endif

        <!-- 2. Data Teknis -->
        <div class="section-title">2. Data Teknis</div>

        <!-- A. Uji Kemasan -->
        <div class="section-title" style="font-size: 13pt; margin-top: 10px;">A. Uji Kemasan</div>
        @if($analisa->dataTeknisKemasan && count($analisa->dataTeknisKemasan) > 0)
            <table>
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Subject</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataTeknisKemasan as $prog)
                    <tr>
                        <td>{!! nl2br(e($prog->nama_teknis_kemasan ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->subject_teknis_kemasan ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->keterangan_teknis_kemasan ?? '')) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- B. Data Teknik Identifikasi -->
        <div class="section-title" style="font-size: 13pt;">B. Data Teknik Identifikasi</div>
        @if($analisa->dataTeknisIdentifikasi && count($analisa->dataTeknisIdentifikasi) > 0)
            <table>
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Subject</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataTeknisIdentifikasi as $prog)
                    <tr>
                        <td>{!! nl2br(e($prog->nama_teknis_identifikasi ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->subject_teknis_identifikasi ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->keterangan_teknis_identifikasi ?? '')) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 3. Data Program Uji -->
        <div class="section-title">3. Data Program Uji</div>
        @if($analisa->programUji && count($analisa->programUji) > 0)
            <table>
                <thead>
                    <tr>
                        <th>Jenis</th>
                        <th>Nama</th>
                        <th>Subject</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->programUji as $prog)
                    <tr>
                        <td>{!! nl2br(e($prog->jenis_program_uji ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->nama_program_uji ?? '-')) !!}</td>
                        <td>{!! nl2br(e($prog->subject_program_uji ?? '-')) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 4. Data Hasil Uji -->
        <div class="section-title">4. Data Hasil Uji</div>
        @if($analisa->dataHasilUji && count($analisa->dataHasilUji) > 0)
            <table>
                <thead>
                    <tr>
                        <th>Jenis</th>
                        <th>Nama Hasil</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataHasilUji as $hasil)
                    <tr>
                        <td>{!! nl2br(e($hasil->jenis_program_uji ?? '-')) !!}</td>
                        <td>{!! nl2br(e($hasil->nama_hasil_uji ?? '-')) !!}</td>
                        <td>{!! nl2br(e($hasil->keterangan_hasil_uji ?? '')) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 5. Kesimpulan -->
        <div class="section-title">5. Kesimpulan</div>
        <p>{!! nl2br(e($analisa->kesimpulanUji->first()->kesimpulan_uji ?? '-')) !!}</p>

        <!-- Tanda tangan -->
        <div class="signature">
            <strong>Manajer Teknis Aneka Kemasan, Produk dan Bahan</strong><br><br>
            <em>Dokumen ini ditandatangani secara elektronik oleh:</em><br>
            <strong>Roni Cristiono</strong>
        </div>
    </main>

    <footer></footer>
</body>
</html>
