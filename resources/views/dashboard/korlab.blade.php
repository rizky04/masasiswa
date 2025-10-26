@extends('layouts.app')

@section('page_title', 'Dashboard Korlab')

@section('content')
  <div class="card">
    <div class="card-body">
      <h5>Halo, {{ $user->name }}</h5>
      <p>Selamat datang di sistem Korlab BBKFK.</p>
    </div>
  </div>
@endsection
