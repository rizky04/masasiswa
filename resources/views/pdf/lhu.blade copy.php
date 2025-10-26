<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>{{ $title }}</title>
    <style>
        @page {
            margin: 0cm;
            /* Hilangkan margin default agar kontrol penuh */
        }

        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 3.5cm 2cm 2.5cm 2cm;
            /* Margin isi laporan (atas, kanan, bawah, kiri) */
            position: relative;
        }

        /* ✅ Header (kop surat) */
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

        /* ✅ Watermark */
        .watermark {
            position: fixed;
            top: 1%;
            left: 2%;
            width: 95%;
            z-index: -1;
            /* Tidak perlu opacity karena watermark sudah dibuat lembut dari desain */
        }

        /* ✅ Footer (opsional) */
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

        /* ✅ Isi laporan */
        main {
            position: relative;
            z-index: 1;
        }

        h1 {
            text-align: center;
            font-size: 16pt;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12pt;
        }

        td {
            vertical-align: top;
            padding: 3px 5px;
        }

        td:first-child {
            width: 30%;
        }
    </style>

    <style>
    .page-break {
        page-break-before: always;
        /* memaksa pindah ke halaman baru */
    }
</style>
</head>

<body>
    <!-- ✅ Watermark -->
    <img src="{{ public_path('images/watermark.png') }}" class="watermark" alt="Watermark">

    <!-- ✅ Isi laporan -->
    <main>
        <h1>LAPORAN HASIL UJI</h1>
        <table>
            <tr>
                <td>Tanggal Laporan</td>
                <td>: {{ $tanggal_laporan }}</td>
            </tr>
            <tr>
                <td>Nomor Analisa</td>
                <td>: {{ $nopcanalisa }}</td>
            </tr>
            <tr>
                <td>Nama Pemohon</td>
                <td>: {{ $pemohon}}</td>
            </tr>
            <tr>
                <td>Alamat</td>
                <td>: {{ $alamat }}</td>
            </tr>
            <tr>
                <td>Alamat Pabrik</td>
                <td>: {{ $alamat_pabrik }}</td>
            </tr>
            <tr>
                <td>Nama Contoh</td>
                <td>: {{ $nama_contoh }}</td>
            </tr>
            <tr>
                <td>Tanggal Penerimaan Contoh</td>
                <td>: {{ $tgl_terima }}</td>
            </tr>
            <tr>
                <td>Tanggal Pengujian</td>
                <td>: {{ $tgl_uji }}</td>
            </tr>
        </table>

 {{-- 🔹 Halaman 2 --}}
    <div class="page-break"></div>
    <br><div>No. Analisa : {{ $nopcanalisa }}</div>
    <h1>HASIL UJI</h1>

    <div class="section-title">1. Contoh Uji</div>
    <p class="indent">
        6 (enam) {{ $nama_contoh }} terdiri dari 3 buah kantong dengan isi dan 3 buah kantong kosong,
        sebagaimana yang dimaksud dengan deskripsi (5H3) dalam ketentuan yang berbeda.
    </p>

    <div class="section-title">2. Data Teknis</div>
    <table>
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
            @foreach ($parameter as $i => $par)
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

    {{-- 🔹 Halaman 3 --}}
    <div class="page-break"></div>
    <br><div>No. Analisa : {{ $nopcanalisa }}</div>
    <h1>HASIL UJI</h1>

    <div class="section-title">3. Program Uji</div>
    <p class="indent">
        Pengujian untuk {{ $nama_contoh }} dilakukan dengan mengacu pada:
        <br>– Recommendations on the Transport of Dangerous Goods
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
