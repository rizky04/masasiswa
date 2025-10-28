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
            top: 0cm;
            left: 0cm;
            right: 0cm;
            height: 3cm;
        }

        header img {
            width: 100%;
            height: auto;
        }

        /* ✅ Watermark menutupi seluruh halaman */
        .watermark {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* opacity: 0.08; */
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

        /* ===== TABEL GAYA PROFESIONAL ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12pt;
            margin-bottom: 15px;
        }

        th, td {
            padding: 6px 10px;
            vertical-align: top;
            text-align: left;
            border: none;
        }

        table th:nth-child(1),
        table td:nth-child(1) {
            width: 28%;
        }

        table th:nth-child(2),
        table td:nth-child(2) {
            width: 35%;
        }

        table th:nth-child(3),
        table td:nth-child(3) {
            width: 37%;
        }

        /* ===== JARAK ANTAR BAGIAN ===== */
        .section-title {
            font-weight: bold;
            margin-top: 25px;
            margin-bottom: 8px;
            text-transform: uppercase;
        }

        p {
            margin: 5px 0;
            text-align: justify;
        }

        .page-break {
            page-break-before: always;
        }

        /* ===== TANDA TANGAN ===== */
        .signature {
            text-align: right;
            margin-top: 60px;
            line-height: 1.5;
        }

        .signature strong {
            display: block;
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

        <table>
            <tr><td>Tanggal Laporan</td><td>: {{ $data['tanggal_laporan'] ?? '-' }}</td></tr>
            <tr><td>Nomor Analisa</td><td>: {{ $data['nopcanalisa'] ?? '-' }}</td></tr>
            <tr><td>Nama Pemohon</td><td>: {{ $data['pemohon'] ?? '-' }}</td></tr>
            <tr><td>Alamat</td><td>: {{ $data['alamat'] ?? '-' }}</td></tr>
            <tr><td>Alamat Pabrik</td><td>: {{ $data['alamat_pabrik'] ?? '-' }}</td></tr>
            {{-- <tr><td>Nama Contoh</td><td>: {!! nl2br($analisa->contohUji->contoh_uji) !!}</td></tr> --}}
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
            <p>{!! nl2br($analisa->contohUji->contoh_uji) !!}</p>
            @if($analisa->contohUji->image)
                <div style="text-align:center; margin-top:10px;">
                    <img src="{{ public_path($analisa->contohUji->image) }}" alt="Contoh Uji" height="200" width="200">
                </div>
            @endif
        @else
            <p>-</p>
        @endif

        <!-- 2. Data Teknis -->
        <div class="section-title">2. Data Teknis <br>A. Uji Kemasan</div>
        @if($analisa->dataTeknisKemasan)
            <table>
                <tbody>
                    @foreach($analisa->dataTeknisKemasan ?? [] as $i => $prog)
                    <tr>
                        <td>{{ strip_tags($prog->nama_teknis_kemasan )?? '-' }}</td>
                        <td>{{ strip_tags($prog->subject_teknis_kemasan) ?? '-' }}</td>
                        <td>{{ strip_tags($prog->keterangan_teknis_kemasan) ?? '' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <div class="section-title">B. Data Teknik Identifikasi</div>
        @if($analisa->dataTeknisIdentifikasi)
            <table>
                <tbody>
                    @foreach($analisa->dataTeknisIdentifikasi ?? [] as $i => $prog)
                    <tr>
                        <td>{{ strip_tags($prog->nama_teknis_identifikasi) ?? '-' }}</td>
                        <td>{{ strip_tags($prog->subject_teknis_identifikasi) ?? '-' }}</td>
                        <td>{{ strip_tags($prog->keterangan_teknis_identifikasi) ?? '' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 3. Data Program Uji -->
        <div class="section-title">3. Data Program Uji</div>
        @if($analisa->programUji)
            <table>
                <tbody>
                    @foreach($analisa->programUji ?? [] as $i => $prog)
                    <tr>
                        <td>{{ strip_tags($prog->jenis_program_uji) ?? '-' }}</td>
                        <td>{{ strip_tags($prog->nama_program_uji) ?? '-' }}</td>
                        <td>{{ strip_tags($prog->subject_program_uji) ?? '-' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 4. Data Hasil Uji -->
        <div class="section-title">4. Data Hasil Uji</div>
        @if($analisa->dataHasilUji)
            <table>
                <tbody>
                    @foreach($analisa->dataHasilUji ?? [] as $i => $hasil)
                    <tr>
                        <td>{{ strip_tags($hasil->jenis_program_uji) ?? '-' }}</td>
                        <td>{{ strip_tags($hasil->nama_hasil_uji) ?? '-' }}</td>
                        <td>{{ strip_tags($hasil->keterangan_hasil_uji) ?? '' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif

        <!-- 5. Kesimpulan -->
        <div class="section-title">5. Kesimpulan</div>
        <p>{{ strip_tags($analisa->kesimpulanUji->first()->kesimpulan_uji) ?? '-' }}</p>

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
