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

    <form id="formHasilUji" action="{{ route('pengujian.store') }}" method="POST" enctype="multipart/form-data">
      @csrf
      @method('POST')

      <!-- 1. Contoh Uji -->
      <h5><strong>1. Contoh Uji</strong></h5>
      <div class="card border mb-4">
        <div class="card-body bg-light">
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="contoh_uji"><strong>Contoh Uji</strong></label>
              <textarea name="contoh_uji" id="contoh_uji" class="form-control editor" rows="5"></textarea>
            </div>
            <div class="form-group col-md-6">
              <label for="image"><strong>Upload Gambar</strong></label>
              <input type="file" name="image" id="image" class="form-control">
               <input type="hidden" name="id_pcanalisa" id="id_pcanalisa"  value="{{ $analisa->id_pcanalisa }}" class="form-control">
            </div>
          </div>
        </div>
      </div>

      <!-- 2. Data Teknis Uji Kemasan -->
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h5 class="mb-0"><strong>2. Data Teknis Uji Kemasan</strong></h5>
        <button type="button" id="addDataTeknis" class="btn btn-success btn-sm">
          <i class="fas fa-plus"></i> Tambah Data
        </button>
      </div>
      <div id="dataTeknisWrapper">
        <div class="form-row data-teknis-item mb-3 p-3 border rounded bg-light">
          <div class="form-group col-md-5">
            <label>Subject Uji Kemasan</label>
            <input type="text" name="subject_uji[]" class="form-control" required>
          </div>
          <div class="form-group col-md-6">
            <label>Content Subject Uji Kemasan</label>
            <textarea name="content_uji[]" class="form-control editor"></textarea>
          </div>
          <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
            <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
          </div>
        </div>
      </div>

      <!-- 3. Data Teknis Identifikasi -->
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h5 class="mb-0"><strong>3. Data Teknis Identifikasi</strong></h5>
        <button type="button" id="addDataIdentifikasi" class="btn btn-success btn-sm">
          <i class="fas fa-plus"></i> Tambah Data
        </button>
      </div>
      <div id="dataIdentifikasiWrapper">
        <div class="form-row data-identifikasi-item mb-3 p-3 border rounded bg-light">
          <div class="form-group col-md-5">
            <label>Nama Teknis Identifikasi</label>
            <input type="text" name="nama_teknis_identifikasi[]" class="form-control" required>
          </div>
          <div class="form-group col-md-6">
            <label>Subject Teknis Identifikasi</label>
            <textarea name="subject_teknis_identifikasi[]" class="form-control editor"></textarea>
          </div>
          <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
            <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
          </div>
        </div>
      </div>

      <!-- 4. Data Program Uji -->
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h5 class="mb-0"><strong>4. Data Program Uji</strong></h5>
        <button type="button" id="addProgramUji" class="btn btn-success btn-sm">
          <i class="fas fa-plus"></i> Tambah Program Uji
        </button>
      </div>
      <div id="programUjiWrapper">
        <div class="form-row program-uji-item mb-3 p-3 border rounded bg-light">
          <div class="form-group col-md-3">
            <label>Jenis Program Uji</label>
            <select name="jenis_program_uji[]" class="form-control" required>
              <option value="">-- Pilih Jenis --</option>
              <option value="Uji Jatuh">Uji Jatuh</option>
              <option value="Uji Kebocoran">Uji Kebocoran</option>
              <option value="Uji Tekanan Dalam">Uji Tekanan Dalam</option>
              <option value="Uji Tumpuk">Uji Tumpuk</option>
            </select>
          </div>
          <div class="form-group col-md-4">
            <label>Nama Program Uji</label>
            <input type="text" name="nama_program_uji[]" class="form-control" required>
          </div>
          <div class="form-group col-md-4">
            <label>Subject Program Uji</label>
            <textarea name="subject_program_uji[]" class="form-control editor"></textarea>
          </div>
          <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
            <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
          </div>
        </div>
      </div>

      <!-- 5. Data Hasil Uji -->
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h5 class="mb-0"><strong>5. Data Hasil Uji</strong></h5>
        <button type="button" id="addHasilUji" class="btn btn-success btn-sm">
          <i class="fas fa-plus"></i> Tambah Hasil Uji
        </button>
      </div>
      <div id="hasilUjiWrapper">
        <div class="form-row hasil-uji-item mb-3 p-3 border rounded bg-light">
          <div class="form-group col-md-3">
            <label>Jenis Program Uji</label>
            <select name="jenis_program_uji_hasil[]" class="form-control" required>
              <option value="">-- Pilih Jenis --</option>
              <option value="Uji Jatuh">Uji Jatuh</option>
              <option value="Uji Kebocoran">Uji Kebocoran</option>
              <option value="Uji Tekanan Dalam">Uji Tekanan Dalam</option>
              <option value="Uji Tumpuk">Uji Tumpuk</option>
            </select>
          </div>
          <div class="form-group col-md-8">
            <label>Nama Hasil Uji</label>
            <input type="text" name="nama_hasil_uji[]" class="form-control" required>
          </div>
          <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
            <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
          </div>
        </div>
      </div>

      <!-- 6. Kesimpulan Uji -->
      <h5><strong>6. Kesimpulan Uji</strong></h5>
      <div class="form-group">
        <label>Kesimpulan Uji</label>
        <textarea name="kesimpulan_uji" class="form-control editor" rows="5" placeholder="Tulis kesimpulan hasil pengujian..."></textarea>
      </div>

      <div class="text-right mt-4">
        <button type="submit" class="btn btn-success">💾 Simpan Hasil</button>
      </div>
    </form>
  </div>
</div>
@endsection
@section('scripts')
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
let editorInstances = [];

function initEditors() {
  document.querySelectorAll('.editor').forEach((el) => {
    if (!el.dataset.editorInitialized) {
      ClassicEditor.create(el, {
        toolbar: [
          'heading', '|', 'bold', 'italic', 'underline', 'link', '|',
          'bulletedList', 'numberedList', '|', 'blockQuote', 'insertTable', '|',
          'undo', 'redo'
        ]
      })
      .then(editor => {
        editorInstances.push(editor);
        el.dataset.editorInitialized = true;
      })
      .catch(error => console.error(error));
    }
  });
}

initEditors();

// Tambah/Remove dynamic fields
const sections = [
  {btn: '#addDataTeknis', wrap: '#dataTeknisWrapper', html: `<div class="form-row data-teknis-item mb-3 p-3 border rounded bg-light">
    <div class="form-group col-md-5">
      <label>Subject Uji Kemasan</label>
      <input type="text" name="subject_uji[]" class="form-control" required>
    </div>
    <div class="form-group col-md-6">
      <label>Content Subject Uji Kemasan</label>
      <textarea name="content_uji[]" class="form-control editor"></textarea>
    </div>
    <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
      <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
    </div>
  </div>`},
  {btn: '#addDataIdentifikasi', wrap: '#dataIdentifikasiWrapper', html: `<div class="form-row data-identifikasi-item mb-3 p-3 border rounded bg-light">
    <div class="form-group col-md-5">
      <label>Nama Teknis Identifikasi</label>
      <input type="text" name="nama_teknis_identifikasi[]" class="form-control" required>
    </div>
    <div class="form-group col-md-6">
      <label>Subject Teknis Identifikasi</label>
      <textarea name="subject_teknis_identifikasi[]" class="form-control editor"></textarea>
    </div>
    <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
      <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
    </div>
  </div>`},
  {btn: '#addProgramUji', wrap: '#programUjiWrapper', html: `<div class="form-row program-uji-item mb-3 p-3 border rounded bg-light">
    <div class="form-group col-md-3">
      <label>Jenis Program Uji</label>
      <select name="jenis_program_uji[]" class="form-control" required>
        <option value="">-- Pilih Jenis --</option>
        <option value="Uji Jatuh">Uji Jatuh</option>
        <option value="Uji Kebocoran">Uji Kebocoran</option>
        <option value="Uji Tekanan Dalam">Uji Tekanan Dalam</option>
        <option value="Uji Tumpuk">Uji Tumpuk</option>
      </select>
    </div>
    <div class="form-group col-md-4">
      <label>Nama Program Uji</label>
      <input type="text" name="nama_program_uji[]" class="form-control" required>
    </div>
    <div class="form-group col-md-4">
      <label>Subject Program Uji</label>
      <textarea name="subject_program_uji[]" class="form-control editor"></textarea>
    </div>
    <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
      <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
    </div>
  </div>`},
  {btn: '#addHasilUji', wrap: '#hasilUjiWrapper', html: `<div class="form-row hasil-uji-item mb-3 p-3 border rounded bg-light">
    <div class="form-group col-md-3">
      <label>Jenis Program Uji</label>
      <select name="jenis_program_uji_hasil[]" class="form-control" required>
        <option value="">-- Pilih Jenis --</option>
        <option value="Uji Jatuh">Uji Jatuh</option>
        <option value="Uji Kebocoran">Uji Kebocoran</option>
        <option value="Uji Tekanan Dalam">Uji Tekanan Dalam</option>
        <option value="Uji Tumpuk">Uji Tumpuk</option>
      </select>
    </div>
    <div class="form-group col-md-8">
      <label>Nama Hasil Uji</label>
      <input type="text" name="nama_hasil_uji[]" class="form-control" required>
    </div>
    <div class="form-group col-md-1 d-flex align-items-center justify-content-center">
      <button type="button" class="btn btn-outline-danger btn-sm btn-remove"><i class="fas fa-trash"></i></button>
    </div>
  </div>`}
];

sections.forEach(sec => {
  $(sec.btn).on('click', function () {
    $(sec.wrap).append(sec.html);
    initEditors();
  });
});

$(document).on('click', '.btn-remove', function () {
  $(this).closest('.form-row').remove();
});

// -------------------- Ajax Submit with SweetAlert --------------------
$('#formHasilUji').on('submit', function(e) {
  e.preventDefault();

  editorInstances.forEach(editor => editor.updateSourceElement());

  // Validasi CKEditor Contoh Uji
  if(!$.trim($('#contoh_uji').val())) {
    Swal.fire({
      icon: 'warning',
      title: 'Oops...',
      text: 'Contoh Uji harus diisi!'
    });
    return;
  }

  let formData = new FormData(this);

  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    beforeSend: function() {
      Swal.fire({
        title: 'Sedang menyimpan...',
        allowOutsideClick: false,
        didOpen: () => {
          Swal.showLoading()
        }
      });
    },
    success: function(res) {
      Swal.fire({
        icon: 'success',
        title: 'Berhasil!',
        text: 'Data berhasil disimpan.'
      }).then(() => {
        // Optional: reset form
        // $('#formHasilUji')[0].reset();
        // location.reload(); ke route ini analis.dataanalisa
        window.location.href = "{{ route('analis.dataanalisa') }}";
      });
    },
    error: function(err) {
      Swal.fire({
        icon: 'error',
        title: 'Gagal!',
        text: 'Terjadi kesalahan saat menyimpan.'
      });
      console.error(err);
    }
  });
});
</script>
@endsection

