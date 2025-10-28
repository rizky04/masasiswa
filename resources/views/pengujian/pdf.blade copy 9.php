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
            line-height: 1.5;
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

        .section-title {
            font-weight: bold;
            margin-top: 25px;
            margin-bottom: 6px;
            text-transform: uppercase;
            border-bottom: 1px solid #000;
            padding-bottom: 3px;
        }

        .page-break {
            page-break-before: always;
        }

        p {
            margin: 4px 0;
            text-align: justify;
        }

        .info-line {
            margin: 3px 0;
        }

        .sub-section {
            margin-top: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .data-block {
            margin-left: 10px;
            margin-bottom: 10px;
        }

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

        <div class="info-line">Tanggal Laporan : {{ $data['tanggal_laporan'] ?? '-' }}</div>
        <div class="info-line">Nomor Analisa : {{ $data['nopcanalisa'] ?? '-' }}</div>
        <div class="info-line">Nama Pemohon : {{ $data['pemohon'] ?? '-' }}</div>
        <div class="info-line">Alamat : {{ $data['alamat'] ?? '-' }}</div>
        <div class="info-line">Alamat Pabrik : {{ $data['alamat_pabrik'] ?? '-' }}</div>
        <div class="info-line">Nama Contoh : {{ strip_tags($analisa->contohUji->contoh_uji ?? $data['nama_contoh'] ?? '-') }}</div>
        <div class="info-line">Tanggal Penerimaan Contoh : {{ $data['tgl_terima'] ?? '-' }}</div>
        <div class="info-line">Tanggal Pengujian : {{ $data['tgl_uji'] ?? '-' }}</div>

        <div class="page-break"></div>
        <h1>HASIL UJI</h1>

        <!-- 1. Contoh Uji -->
        <div class="section-title">1. Contoh Uji</div>
        @if($analisa->contohUji)
            <p>{{ strip_tags($analisa->contohUji->contoh_uji) }}</p>
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
        <div class="sub-section">A. Uji Kemasan</div>
        @if($analisa->dataTeknisKemasan && count($analisa->dataTeknisKemasan) > 0)
            <div class="data-block">
                @foreach($analisa->dataTeknisKemasan as $prog)
                    <p>
                        {{ strip_tags($prog->nama_teknis_kemasan ?? '-') }}
                         {{ strip_tags($prog->subject_teknis_kemasan ?? '-') }}
                        {{ strip_tags($prog->keterangan_teknis_kemasan ?? '') }}
                    </p>
                @endforeach
            </div>
        @else
            <p>-</p>
        @endif

        <!-- B. Data Teknik Identifikasi -->
        <div class="sub-section">B. Data Teknik Identifikasi</div>
        @if($analisa->dataTeknisIdentifikasi && count($analisa->dataTeknisIdentifikasi) > 0)
            <div class="data-block">
                @foreach($analisa->dataTeknisIdentifikasi as $prog)
                    <p>
                        {{ strip_tags($prog->nama_teknis_identifikasi ?? '-') }}
                        {{ strip_tags($prog->subject_teknis_identifikasi ?? '-') }}
                        {{ strip_tags($prog->keterangan_teknis_identifikasi ?? '') }}
                    </p>
                @endforeach
            </div>
        @else
            <p>-</p>
        @endif

        <!-- 3. Data Program Uji -->
        <div class="section-title">3. Data Program Uji</div>
        @if($analisa->programUji && count($analisa->programUji) > 0)
            <div class="data-block">
                @foreach($analisa->programUji as $prog)
                    <p>
                        {{ strip_tags($prog->jenis_program_uji ?? '-') }}
                        {{ strip_tags($prog->nama_program_uji ?? '-') }}
                        {{ strip_tags($prog->subject_program_uji ?? '') }}
                    </p>
                @endforeach
            </div>
        @else
            <p>-</p>
        @endif

        <!-- 4. Data Hasil Uji -->
        <div class="section-title">4. Data Hasil Uji</div>
        @if($analisa->dataHasilUji && count($analisa->dataHasilUji) > 0)
            <div class="data-block">
                @foreach($analisa->dataHasilUji as $hasil)
                    <p>
                        {{ strip_tags($hasil->jenis_program_uji ?? '-') }}
                        {{ strip_tags($hasil->nama_hasil_uji ?? '-') }}
                        {{ strip_tags($hasil->keterangan_hasil_uji ?? '') }}
                    </p>
                @endforeach
            </div>
        @else
            <p>-</p>
        @endif

        <!-- 5. Kesimpulan -->
        <div class="section-title">5. Kesimpulan</div>
        <p>{{ strip_tags($analisa->kesimpulanUji->first()->kesimpulan_uji ?? '-') }}</p>

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
