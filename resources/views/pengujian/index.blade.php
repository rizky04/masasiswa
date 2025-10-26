@extends('layouts.app')
@section('page_title', 'Data Pengujian')

@section('content')
  <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title">Daftar Data Pengujian</h3>

                </div>

                <div class="card-body table-responsive">
                    <a href="{{ route('pengujian.create') }}" class="btn btn-primary btn-sm mb-3">
                        <i class="fas fa-plus"></i> Tambah Data
                    </a>
                    <table id="example1" class="table table-bordered table-striped">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th width="5%">No</th>
                                <th>Contoh Uji</th>
                                <th>Data Teknis</th>
                                <th>Program Uji</th>
                                <th>Hasil Uji</th>
                                <th>Kesimpulan</th>
                                <th>Foto</th>
                                <th width="15%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($pengujian as $index => $item)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{!! Str::limit(strip_tags($item->contoh_uji), 40) !!}</td>
                                    <td>{!! Str::limit(strip_tags($item->data_teknis), 40) !!}</td>
                                    <td>{!! Str::limit(strip_tags($item->program_uji), 40) !!}</td>
                                    <td>{!! Str::limit(strip_tags($item->hasil_uji), 40) !!}</td>
                                    <td>{!! Str::limit(strip_tags($item->kesimpulan), 40) !!}</td>
                                    <td>
                                        @if ($item->foto)
                                            <img src="{{ asset($item->foto) }}" alt="Foto" width="70"
                                                class="rounded">
                                        @else
                                            <span class="text-muted">Tidak ada</span>
                                        @endif
                                    </td>
                                    <td>
                                        <a href="{{ route('pengujian.edit', $item->id) }}" class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('pengujian.destroy', $item->id) }}" method="POST"
                                            class="d-inline" onsubmit="return confirm('Yakin hapus data ini?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm"><i
                                                    class="fas fa-trash"></i></button>
                                        </form>
                                        <a href="{{ route('pengujian.pdf', $item->id) }}" target="_blank"
                                            class="btn btn-info btn-sm">
                                            <i class="fas fa-file-pdf"></i>
                                        </a>

                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center text-muted">Belum ada data</td>
                                </tr>
                            @endforelse
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

