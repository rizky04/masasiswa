<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('mst_standar_uji', function (Blueprint $table) {
            $table->id(); // kolom 'id' sebagai primary key
            $table->string('kode_standar', 50)->nullable();
            $table->string('nama_standar', 255);
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('mst_standar_uji');
    }
};
