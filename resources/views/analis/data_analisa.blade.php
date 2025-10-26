@extends('layouts.app')

@section('page_title', 'Data Analisa')

@section('content')

    <div class="card border-top border-primary shadow-sm">
        <div class="card-body">
            <form id="filterForm" onsubmit="return false;">
                <div class="form-group">
                    <label>Pilih Tahun</label>
                    <select id="tahun" class="form-control select2">
                        <option selected="selected">-- Pilih Tahun --</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                    </select>
                </div>
                <button id="filterBtn" type="button" class="btn btn-primary">Tampilkan!</button>
            </form>
        </div>
    </div>


    <div class="card">
        <div class="card-header">
            <h3 class="card-title">DataTable dengan fitur lengkap</h3>
        </div>

        <div class="card-body">

            {{-- 🔹 Tabel Data --}}
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No. Analisa</th>
                        <th>Sampel</th>
                        <th>Keterangan</th>
                        <th>Parameter</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @php $no = 1; @endphp
                    @foreach ($data as $pc)
                        @foreach ($pc->pcanalisa as $an)
                            <tr>
                                <td>{{ $no++ }}.</td>
                                <td>{{ $an->nopcanalisa ?? '-' }}</td>
                                <td>{{ $an->namasample_indo ?? 'Tidak ada data' }}</td>
                                <td>
                                    <b>SPM:</b> {{ $an->spm ?? '-' }} Hari Kerja<br>
                                    <b>Tanggal Order:</b> {{ \Carbon\Carbon::parse($pc->tgl_order)->format('d-m-Y') }}<br>
                                    <b>Tanggal Perkiraan Selesai:</b>
                                    {{ \Carbon\Carbon::parse($an->tgl_perkiraan_analisaselesai)->format('d-m-Y') }}<br>
                                    <b>Tanggal Validasi Kerjasama:</b> {{ $pc->tgl_samplingmulai ?? '-' }}<br>
                                    <b>Tanggal Proses MT:</b> {{ $pc->tgl_samplingselesai ?? '-' }}<br>
                                    <b>Tanggal Terima Korlab:</b> {{ $pc->tgl_input ?? '-' }}
                                </td>
                                <td>
                                    @foreach ($an->pcpar as $p)
                                        <div class="mb-2">
                                            <b>{{ $p->jenispcpar == 'parameter' ? 'Parameter:' : 'Syarat Mutu:' }}</b><br>
                                            {!! nl2br(e($p->nama_parameter_in ?? '-')) !!}
                                        </div>
                                    @endforeach
                                </td>
                                <td>
                                    <a href="{{ route('analis.input-hasil', ['id' => $an->id_pcanalisa]) }}">[Input Hasil]</a>
                                     {{-- <a href="{{ route('pengujian.create') }}" class="btn btn-primary btn-sm mb-3">
                                            <i class="fas fa-plus"></i> input uji
                                        </a> --}}
                                         <a href="{{ route('pengujian.show', $an->id_pcanalisa) }}" class="btn btn-info btn-sm">
                    <i class="fas fa-eye"></i> View analisa
                </a>

                  <!-- Edit Analisa -->
    <a href="{{ route('pengujian.edit', $an->id_pcanalisa) }}" class="btn btn-warning btn-sm mb-1">
        <i class="fas fa-pencil-alt"></i> Edit
    </a>
                                </td>


                            </tr>
                        @endforeach
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

@section('scripts')
    <!-- DataTables  & Plugins -->
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>

    <script>
        $(document).ready(function() {

            // 🔹 Inisialisasi DataTable
            var table = $("#example1").DataTable({
                responsive: true,
                lengthChange: true,
                autoWidth: false,
                ordering: false,

            });

            // 🔹 Tempel tombol export di atas tabel
            table.buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

            // 🔹 Tombol filter tahun
            $('#filterBtn').on('click', function() {
                const tahunDipilih = $('#tahun').val(); // ambil dari select id="tahun"

                // Reset semua filter sebelumnya
                $.fn.dataTable.ext.search = [];

                if (tahunDipilih && tahunDipilih !== "-- Pilih Tahun --") {
                    $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
                        const tahunBaris = data[4]; // kolom ke-5 (indeks 4) berisi tahun
                        return tahunBaris == tahunDipilih;
                    });
                }

                table.draw(); // refresh tabel
            });

        });
    </script>

@endsection
