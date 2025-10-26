<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('mst_produk', function (Blueprint $table) {
            $table->id(); // kolom id sebagai PK
            $table->string('kode_produk', 50)->nullable();
            $table->string('nama_produk', 255);
            $table->text('deskripsi')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('mst_produk');
    }
};
