@extends('layouts.app')
@section('title', 'Data Pengujian')

@section('content')
<div class="content-header">
  <div class="container-fluid">
    <h1 class="m-0">Data Pengujian</h1>
  </div>
</div>

<section class="content">
  <div class="container-fluid">
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title">Daftar Data Pengujian</h3>
        <a href="{{ route('pengujian.create') }}" class="btn btn-primary btn-sm">
          <i class="fas fa-plus"></i> Tambah Data
        </a>
      </div>

      <div class="card-body table-responsive">
        <table class="table table-bordered table-striped">
          <thead class="bg-primary text-white">
            <tr>
              <th width="5%">No</th>
              <th>Contoh Uji</th>
              <th>Program Uji</th>
              <th>Hasil Uji</th>
              <th>Foto</th>
              <th width="15%">Aksi</th>
            </tr>
          </thead>
          <tbody>
            @forelse($pengujian as $index => $item)
              <tr>
                <td>{{ $index + 1 }}</td>
                <td>{!! Str::limit(strip_tags($item->contoh_uji), 40) !!}</td>
                <td>{!! Str::limit(strip_tags($item->program_uji), 40) !!}</td>
                <td>{!! Str::limit(strip_tags($item->hasil_uji), 40) !!}</td>
                <td>
                  @if($item->foto)
                    <img src="{{ asset($item->foto) }}" alt="Foto" width="70" class="rounded">
                  @else
                    <span class="text-muted">Tidak ada</span>
                  @endif
                </td>
                <td>
                  <a href="{{ route('pengujian.edit', $item->id) }}" class="btn btn-warning btn-sm">
                    <i class="fas fa-edit"></i>
                  </a>
                  <form action="{{ route('pengujian.destroy', $item->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Yakin hapus data ini?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                  </form>
                  <a href="{{ route('pengujian.pdf', $item->id) }}" target="_blank" class="btn btn-info btn-sm">
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
  </div>
</section>
@endsection
