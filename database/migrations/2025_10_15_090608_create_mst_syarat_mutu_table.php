<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mst_syarat_mutu', function (Blueprint $table) {
    $table->id();
    $table->string('kode_syarat', 50)->nullable();
    $table->string('nama_syarat', 255);
    $table->timestamps();
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_syarat_mutu');
    }
};
