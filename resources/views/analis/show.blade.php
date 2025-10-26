@extends('layouts.app')

@section('page_title', 'Detail Hasil Pengujian')

@section('content')
<div class="card shadow-sm">
    <div class="card-body">
        <h4><strong>Detail Hasil Pengujian</strong></h4>
        <hr>

        {{-- Data Analisa --}}
        <h5><strong>1. Data Analisa</strong></h5>
        <table class="table table-sm table-borderless">
            <tr>
                <td><b>Nama Sample</b></td>
                <td>: {{ $analisa->namasample_indo ?? '-' }}</td>
            </tr>
            <tr>
                <td><b>No. Analisa</b></td>
                <td>: {{ $analisa->nopcanalisa }}</td>
            </tr>
            <tr>
                <td><b>Lama Pengujian</b></td>
                <td>: {{ $analisa->spm }} Hari Kerja</td>
            </tr>
            <tr>
                <td><b>Tanggal Pengujian</b></td>
                <td>: {{ $analisa->tgl_pengujian ?? '-' }}</td>
            </tr>
        </table>
        <hr>

        {{-- Contoh Uji --}}
        <h5><strong>2. Contoh Uji</strong></h5>
        @if($analisa->contohUji)
            {{-- @foreach($analisa->contohUji as $item)
                <div class="mb-3 p-3 border rounded bg-light">
                    <p>{!! nl2br($analisa->contohUji->contoh_uji) !!}</p>
                    @if($analisa->contohUji->image)
                        <img src="{{ asset($analisa->contohUji->image) }}" alt="Contoh Uji" class="img-fluid">
                    @endif
                </div>
            @endforeach --}}
              <div class="mb-3 p-3 border rounded bg-light">
                    <p>{!! nl2br($analisa->contohUji->contoh_uji) !!}</p>
                    @if($analisa->contohUji->image)
                        <img src="{{ asset($analisa->contohUji->image) }}" alt="Contoh Uji" class="img-fluid">
                    @endif
                </div>
        @else
            <p>-</p>
        @endif
        <hr>

        {{-- Data Teknis Uji Kemasan --}}
        <h5><strong>3. Data Teknis Uji Kemasan</strong></h5>
        @if($analisa->dataTeknisKemasan)
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Subject Uji</th>
                        <th>Content</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataTeknisKemasan as $item)
                        <tr>
                             <td>{!! nl2br($item->nama_teknis_kemasan) !!}</td>
                            <td>{!! nl2br($item->subject_teknis_kemasan) !!}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif
        <hr>

        {{-- Data Teknis Identifikasi --}}
        <h5><strong>4. Data Teknis Identifikasi</strong></h5>
        @if($analisa->dataTeknisIdentifikasi)
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nama Teknis Identifikasi</th>
                        <th>Subject</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataTeknisIdentifikasi as $item)
                        <tr>
                            <td>{{ $item->nama_teknis_identifikasi }}</td>
                            <td>{!! nl2br($item->subject_teknis_identifikasi) !!}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif
        <hr>

        {{-- Program Uji --}}
        <h5><strong>5. Data Program Uji</strong></h5>
        @if($analisa->programUji)
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Jenis Program Uji</th>
                        <th>Nama Program</th>
                        <th>Subject Program</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->programUji as $item)
                        <tr>
                            <td>{{ $item->jenis_program_uji }}</td>
                            <td>{{ $item->nama_program_uji }}</td>
                            <td>{!! nl2br($item->subject_program_uji) !!}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif
        <hr>

        {{-- Data Hasil Uji --}}
        <h5><strong>6. Data Hasil Uji</strong></h5>
        @if($analisa->dataHasilUji)
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Jenis Program Uji</th>
                        <th>Nama Hasil Uji</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($analisa->dataHasilUji as $item)
                        <tr>
                            <td>{{ $item->jenis_program_uji }}</td>
                            <td>{{ $item->nama_hasil_uji }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>-</p>
        @endif
        <hr>

        {{-- Kesimpulan Uji --}}
        <h5><strong>7. Kesimpulan Uji</strong></h5>
        @if($analisa->kesimpulanUji)
            @foreach($analisa->kesimpulanUji as $item)
                <div class="mb-3 p-3 border rounded bg-light">
                    <p>{!! nl2br($item->kesimpulan_uji) !!}</p>
                </div>
            @endforeach
        @else
            <p>-</p>
        @endif

        <a href="{{ route('analis.dataanalisa') }}" class="btn btn-secondary mt-3">⬅ Kembali</a>
    </div>
</div>
@endsection
