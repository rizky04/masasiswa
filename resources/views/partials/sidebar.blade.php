@php
    $user = Auth::user();
@endphp

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link text-center">
        <span class="brand-text font-weight-light">Intranet BBKFK</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{ asset('dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User">
            </div>
            <div class="info text-white">
                <a href="#" class="d-block">{{ $user->name }}</a>
                <small class="text-muted">({{ ucfirst($user->role) }})</small>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                    aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" role="menu">

                {{-- Menu Umum --}}
                <li class="nav-item">
                    <a href="/home" class="nav-link">
                        <i class="nav-icon fas fa-home"></i>
                        <p>Beranda</p>
                    </a>
                </li>
                {{-- <li class="nav-item">
                        <a href="{{ route('pengujian.index') }}"
                            class="nav-link {{ request()->routeIs('pengujian.*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-vial"></i>
                            <p>pengujian</p>
                        </a>
                    </li> --}}
                {{-- Menu untuk Analis --}}
                @if ($user->role === 'analis')
                    <li class="nav-item">
                        <a href="{{ route('analis.dataanalisa') }}"
                            class="nav-link {{ request()->routeIs('analis.dataanalisa') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-vial"></i>
                            <p>Data Analisa</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>Input Hasil Uji</p>
                        </a>
                    </li>
                @endif

                {{-- Menu untuk Korlab --}}
                @if ($user->role === 'korlab')
                    <li class="nav-item">
                        <a href="{{ route('korlab.datavalidasi') }}"
                            class="nav-link {{ request()->routeIs('korlab.datavalidasi') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-vial"></i>
                            <p>Data Analisa</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-check-circle"></i>
                            <p>Validasi LHU</p>
                        </a>
                    </li>
                @endif

                {{-- Menu untuk Manajer --}}
                @if ($user->role === 'manajer')
                    <li class="nav-item">
                        <a href="{{ route('manajer.validasi-lhu') }}"
                            class="nav-link {{ request()->routeIs('manajer.validasi-lhu') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-check-circle"></i>
                            <p>Validasi LHU</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-pen-nib"></i>
                            <p>Penandatanganan LHU</p>
                        </a>
                    </li>
                @endif

            </ul>
        </nav>
    </div>
</aside>
