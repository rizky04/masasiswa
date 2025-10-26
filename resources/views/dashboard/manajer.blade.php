@extends('layouts.app')

@section('page_title', 'Dashboard Manajer')

@section('content')
  <div class="card">
    <div class="card-body">
      <h5>Halo, {{ $user->name }}</h5>
      <p>Selamat datang di sistem Manajer Teknis BBKFK.</p>
    </div>
  </div>
@endsection
