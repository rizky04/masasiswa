@extends('layouts.app')

@section('page_title', 'Data Validasi Korlab')

@section('content')

    {{-- 🔹 Filter Form --}}
    <div class="card card-outline border-top border-primary shadow-sm">
        <div class="card-body">
            <form id="filterForm" onsubmit="return false;">
                <div class="form-group">
                    <label>Status Validasi</label>
                    <select id="status" name="status" class="form-control">
                        <option value="">-- Semua Status --</option>
                        <option value="Setuju">Setuju</option>
                        <option value="Revisi">Revisi</option>
                        <option value="Ditolak">Ditolak</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Tahun</label>
                    <select id="tahun" name="tahun" class="form-control">
                        <option value="">-- Semua Tahun --</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                    </select>
                </div>
                <button id="filterBtn" type="button" class="btn btn-primary">Tampilkan!!</button>
            </form>
        </div>
    </div>

    {{-- 🔹 Tabel Data --}}
    <div class="card mt-3">
        <div class="card-header">
            <h3 class="card-title">Validasi LHU</h3>
        </div>

        <div class="card-body">
            <table id="tableValidasi" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Identitas Sample</th>
                        <th>Parameter</th>
                        <th>Keterangan</th>
                        <th>Preview LHU</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                @php $no = 1; @endphp
                @foreach ($data as $pc)
                    @foreach ($pc->pcanalisa as $an)
                        <tr>
                            <td>{{ $no++ }}.</td>
                                <td>
                                    <strong>{{ $an->nopcanalisa ?? '-' }}</strong><br>
                                    {{ $an->namasample_indo ?? '-' }}<br>
                                    <b>Data Dukung:</b><br>
                                    <a href="#">[Data Migrasi]</a>
                                    <a href="#">[Foto Sample]</a>
                                </td>
                                <td>
                                    @foreach ($an->pcpar as $par)
                                            {{ $par->nama_parameter_in ?? '-' }}
                                    @endforeach
                                </td>
                                <td>
                                    <b>SPM:</b> {{ $an->spm ?? '-' }} Hari Kerja<br>
                                    <b>Tanggal Order:</b> {{ \Carbon\Carbon::parse($pc->tgl_order)->format('d-m-Y') }}<br>
                                    <b>Tanggal Selesai:</b>
                                    {{ \Carbon\Carbon::parse($an->tgl_perkiraan_analisaselesai)->format('d-m-Y') }}
                                </td>
                                <td>
                                    <b>Logo KAN:</b> {{ $an->logo_kan ?? 'ya' }}<br>
                                    <b>Penandatangan:</b> {{ $an->penandatangan ?? '-' }}<br>
                                    <b>Jenis ttd:</b> {{ $an->jenis_ttd ?? 'elektronik' }}<br>
                                    <a href="{{ route('lhu.preview', ['path' => $an->nopcanalisa ?? 'unknown']) }}"
                                        class="btn btn-info btn-sm mt-2" target="_blank" title="Lihat LHU">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                </td>
                                
                                <td class="text-center">
                                    <div class="d-flex justify-content-center" style="gap: 5px;">
                                        <button class="btn btn-success btn-sm px-3 btn-validasi"
                                            data-id="{{ $an->id_pcanalisa }}">Validasi</button>
                                        <button class="btn btn-danger btn-sm px-3 btn-tolak"
                                            data-id="{{ $an->id_pcanalisa }}">Tolak</button>
                                    </div>
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
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>

    <script>
        $(function() {
            const table = $("#tableValidasi").DataTable({
                responsive: true,
                lengthChange: true,
                autoWidth: false,
                ordering: false,
            });

            table.buttons().container().appendTo('#tableValidasi_wrapper .col-md-6:eq(0)');

            // 🔹 Filter berdasarkan Status dan Tahun
            $('#filterBtn').on('click', function() {
                const status = $('#status').val();
                const tahun = $('#tahun').val();

                $.fn.dataTable.ext.search = [];

                if (status || tahun) {
                    $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
                        const baris = $(table.row(dataIndex).node());
                        const statusBaris = baris.data('status');
                        const tahunBaris = baris.data('tahun');

                        let cocok = true;

                        if (status && statusBaris !== status) cocok = false;
                        if (tahun && tahunBaris != tahun) cocok = false;

                        return cocok;
                    });
                }

                table.draw();
            });
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click', '.btn-validasi, .btn-tolak', function() {
    let id = $(this).data('id');
    let aksi = $(this).hasClass('btn-validasi') ? 'validasi' : 'tolak';

    $.ajax({
        url: "{{ route('update.status.validasi') }}",
        type: "POST",
        data: {
            _token: "{{ csrf_token() }}",
            id: id,
            aksi: aksi
        },
        success: function(response) {
            if (response.success) {
                alert("Status berhasil diubah menjadi: " + response.status);
                location.reload();
            } else {
                alert("Gagal memperbarui status");
            }
        },
        error: function() {
            alert("Terjadi kesalahan server");
        }
    });
});
</script>

@endsection
