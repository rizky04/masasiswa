@extends('layouts.app')
@section('title', 'Edit Data Pengujian')

@section('content')
<div class="content-header">
  <div class="container-fluid">
    <h1 class="m-0">Edit Data Pengujian</h1>
  </div>
</div>

<section class="content">
  <div class="container-fluid">
    <div class="card card-warning">
      <form action="{{ route('pengujian.update', $pengujian->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="card-body">
          <div class="form-group">
            <label>Contoh Uji</label>
            <textarea name="contoh_uji" class="form-control editor">{{ $pengujian->contoh_uji }}</textarea>
          </div>

          <div class="form-group">
            <label>Data Teknis</label>
            <textarea name="data_teknis" class="form-control editor">{{ $pengujian->data_teknis }}</textarea>
          </div>

          <div class="form-group">
            <label>Program Uji</label>
            <textarea name="program_uji" class="form-control editor">{{ $pengujian->program_uji }}</textarea>
          </div>

          <div class="form-group">
            <label>Hasil Uji</label>
            <textarea name="hasil_uji" class="form-control editor">{{ $pengujian->hasil_uji }}</textarea>
          </div>

          <div class="form-group">
            <label>Kesimpulan</label>
            <textarea name="kesimpulan" class="form-control editor">{{ $pengujian->kesimpulan }}</textarea>
          </div>

          <div class="form-group">
            <label>Foto Sekarang</label><br>
            @if ($pengujian->foto)
              <img src="{{ asset($pengujian->foto) }}" alt="Foto" width="120" class="mb-2 rounded">
            @else
              <p class="text-muted">Tidak ada foto</p>
            @endif
            <input type="file" name="foto" class="form-control mt-2">
          </div>
        </div>

        <div class="card-footer">
          <button type="submit" class="btn btn-warning">Update</button>
          <a href="{{ route('pengujian.index') }}" class="btn btn-secondary">Kembali</a>
        </div>
      </form>
    </div>
  </div>
</section>
@endsection

@section('scripts')
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
@endsection
