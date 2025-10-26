<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Laporan Pengujian #{{ $pengujian->id }}</title>
  <style>
    body {
      font-family: DejaVu Sans, sans-serif;
      font-size: 12px;
      line-height: 1.6;
    }
    h2, h3 {
      text-align: center;
      margin-bottom: 10px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    td {
      vertical-align: top;
      padding: 5px;
    }
    .section-title {
      background-color: #f0f0f0;
      font-weight: bold;
      padding: 4px 6px;
      margin-top: 10px;
    }
    .foto {
      text-align: center;
      margin-top: 15px;
    }
    img {
      max-width: 300px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
  </style>
</head>
<body>

  <h2>LAPORAN HASIL PENGUJIAN</h2>
  <h3>ID: {{ $pengujian->id }}</h3>

  <div class="section">
    <div class="section-title">1. Contoh Uji</div>
    <div>{!! $pengujian->contoh_uji !!}</div>
  </div>

  <div class="section">
    <div class="section-title">2. Data Teknis</div>
    <div>{!! $pengujian->data_teknis !!}</div>
  </div>

  <div class="section">
    <div class="section-title">3. Program Uji</div>
    <div>{!! $pengujian->program_uji !!}</div>
  </div>

  <div class="section">
    <div class="section-title">4. Hasil Uji</div>
    <div>{!! $pengujian->hasil_uji !!}</div>
  </div>

  <div class="section">
    <div class="section-title">5. Kesimpulan</div>
    <div>{!! $pengujian->kesimpulan !!}</div>
  </div>

  @if($pengujian->foto)
  <div class="section foto">
    <div class="section-title">6. Foto</div>
    <img src="{{ public_path($pengujian->foto) }}" alt="Foto Uji">
  </div>
  @endif

</body>
</html>
