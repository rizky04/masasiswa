@extends('layouts.app')

@section('page_title', 'Input Hasil Uji')

@section('content')
    <div class="card shadow-sm">
        <div class="card-body">
            <h4><strong>Data Analisa</strong></h4>
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

            <form action="{{ route('analis.input-hasil.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <h5><strong>Daftar Parameter Uji</strong></h5>

                {{-- <table class="table table-bordered">
                    <thead>
                        <tr class="table-primary">
                            <th>No</th>
                            <th>Parameter Uji</th>
                            <th>Satuan</th>
                            <th>Hasil Uji</th>
                            <th>Syarat Mutu</th>
                            <th>Metode Uji</th>
                            <th>Foto</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($analisa->pcpar as $i => $par)
                            <tr>
                                <td>{{ $i + 1 }}</td>
                                <td>{{ $par->parameter->nama_parameter ?? '-' }}</td>
                                <td>{{ $par->satuan ?? '-' }}</td>
                                <td>
                                    <input type="text" name="hasil[{{ $par->id_pcpar }}]" class="form-control"
                                        value="{{ $par->hasil ?? '' }}">
                                </td>
                                <td>{{ $par->syarat_mutu ?? '-' }}</td>
                                <td>{{ $par->metode_uji ?? '-' }}</td>
                                <td><button type="button" class="btn btn-sm btn-info">Lampirkan Foto</button></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table> --}}
                 <h5><strong>1. Contoh Uji</strong></h5>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="contoh_uji">Contoh Uji</label>
                        <input type="text" name="contoh_uji" id="contoh_uji" class="form-control" required>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="image">Upload Gambar</label>
                        <input type="file" name="image" id="image" class="form-control">
                    </div>

                </div>
          <h5><strong>2. Data Teknis</strong></h5>

<div id="dataTeknisWrapper">
  <div class="form-row data-teknis-item mb-3">
    <div class="form-group col-md-5">
      <label>Subject Uji Kemasan</label>
      <input type="text" name="subject_uji[]" class="form-control" required>
    </div>
    <div class="form-group col-md-6">
      <label>Content Subject Uji Kemasan</label>
      <textarea name="content_uji[]" class="form-control editor"></textarea>
    </div>
    <div class="form-group col-md-1 d-flex align-items-end">
      <button type="button" class="btn btn-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
    </div>
  </div>
</div>

<button type="button" id="addDataTeknis" class="btn btn-success btn-sm">
  <i class="fas fa-plus"></i> Tambah Data Teknis
</button>



                <div class="text-right mt-3">
                    <button type="submit" class="btn btn-success">💾 Simpan Hasil</button>
                    <button type="button" class="btn btn-warning">📤 Kirim ke Korlab</button>
                </div>
            </form>
        </div>
    </div>
@endsection

{{-- @section('scripts')
    <!-- CKEditor 5 CDN -->
    <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/classic/ckeditor.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('.editor').forEach((el) => {
                ClassicEditor
                    .create(el)
                    .catch(error => console.error(error));
            });
        });
    </script>
@endsection --}}

@section('scripts')
<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>

<script>
  let editorInstances = [];

  // Fungsi untuk inisialisasi CKEditor
  function initEditors() {
    document.querySelectorAll('.editor').forEach((el) => {
      if (!el.classList.contains('ck-editor__editable')) {
        ClassicEditor.create(el)
          .then(editor => {
            editorInstances.push(editor);
          })
          .catch(error => console.error(error));
      }
    });
  }

  // Inisialisasi pertama
  initEditors();

  // Tombol tambah data teknis
  $('#addDataTeknis').on('click', function () {
    let newItem = `
      <div class="form-row data-teknis-item mb-3">
        <div class="form-group col-md-5">
          <label>Subject Uji Kemasan</label>
          <input type="text" name="subject_uji[]" class="form-control" required>
        </div>
        <div class="form-group col-md-6">
          <label>Content Subject Uji Kemasan</label>
          <textarea name="content_uji[]" class="form-control editor"></textarea>
        </div>
        <div class="form-group col-md-1 d-flex align-items-end">
          <button type="button" class="btn btn-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
        </div>
      </div>
    `;

    $('#dataTeknisWrapper').append(newItem);
    initEditors(); // Inisialisasi ulang CKEditor untuk elemen baru
  });

  // Tombol hapus baris
  $(document).on('click', '.btn-remove', function () {
    $(this).closest('.data-teknis-item').remove();
  });
</script>
@endsection

