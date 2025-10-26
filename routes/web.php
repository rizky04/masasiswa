<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SesiController;
use App\Http\Controllers\HasilUjiController;
use App\Http\Controllers\ValidasiController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\DomPdfController;
 use App\Http\Controllers\PengujianController;


Route::get('/lhu/{path}/preview', [DomPdfController::class, 'previewLHU'])
     ->where('path', '.*')
     ->name('lhu.preview');


/*
|--------------------------------------------------------------------------
| ROUTING SISTEM MULTI-USER BBKFK
|--------------------------------------------------------------------------
*/

// ========== LOGIN & LOGOUT ==========
Route::middleware('guest')->group(function () {
    Route::get('/', [SesiController::class, 'index'])->name('login');
    Route::post('/', [SesiController::class, 'login']);
});

Route::post('/logout', [SesiController::class, 'logout'])->name('logout');


// ========== HALAMAN DASHBOARD PER ROLE ==========
Route::middleware('auth')->group(function () {

    //pengujian


Route::resource('pengujian', PengujianController::class);
Route::get('pengujian/{id}/pdf', [PengujianController::class, 'pdf'])->name('pengujian.pdf');
Route::get('/analisa/{id}/pdf', [PengujianController::class, 'generatePdf'])
    ->name('analis.pdf');

Route::post('/pengujian/update/{id}', [PengujianController::class,'update']);


    // 🔹 DASHBOARD ANALIS
    Route::get('/dashboard/analis', [AdminController::class, 'analis'])
        ->name('analis.dashboard')
        ->middleware('role:analis');

    // 🔹 HALAMAN DATA ANALISA (khusus analis)
    Route::get('/analis/data-analisa', [AdminController::class, 'dataAnalisa'])
        ->name('analis.dataanalisa')
        ->middleware('role:analis');

    // 🔹 DASHBOARD KORLAB
    Route::get('/dashboard/korlab', [AdminController::class, 'korlab'])
        ->name('korlab.dashboard')
        ->middleware('role:korlab');

    // 🔹 HALAMAN DATA ANALISA (khusus korlab)
    Route::get('/korlab/data-validasi', [AdminController::class, 'dataValidasi'])
        ->name('korlab.datavalidasi')
        ->middleware('role:korlab');


    // 🔹 DASHBOARD MANAJER
    Route::get('/dashboard/manajer', [AdminController::class, 'manajer'])
        ->name('manajer.dashboard')
        ->middleware('role:manajer');

    Route::get('/manajer/validasi-lhu', [AdminController::class, 'validasiLHU'])
        ->name('manajer.validasi-lhu')
        ->middleware('role:manajer');

    // 🔹 Redirect otomatis dari /home ke dashboard sesuai role
    Route::get('/home', function () {
        $user = Auth::user();
        return redirect()->route($user->role . '.dashboard');
    })->name('home');

    Route::post('/update-status-validasi', [ValidasiController::class, 'updateStatus'])
    ->name('update.status.validasi');

    Route::get('/analis/input-hasil/{id}', [App\Http\Controllers\InputHasilController::class, 'show'])
    ->name('analis.input-hasil');

    Route::post('/analis/input-hasil/update', [App\Http\Controllers\InputHasilController::class, 'update'])
    ->name('analis.input-hasil.update');


});
