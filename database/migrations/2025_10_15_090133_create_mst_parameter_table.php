<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('mst_parameter', function (Blueprint $table) {
            $table->id(); // unsignedBigInteger otomatis
            $table->string('kode_parameter', 50)->nullable();
            $table->string('nama_parameter_in', 255);
            $table->string('nama_parameter_en', 255)->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('mst_parameter');
    }
};
