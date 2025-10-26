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
        Schema::create('hasil_uji', function (Blueprint $table) {
            $table->id('id_hasil_uji');

            $table->unsignedBigInteger('id_pcpar');
            $table->foreign('id_pcpar')->references('id_pcpar')->on('pcpar')->onDelete('cascade');

            // 🔹 Hasil uji (Indonesia & Inggris)
            $table->text('hasil_uji_in')->nullable();
            $table->text('hasil_uji_en')->nullable();

            // 🔹 Ketidakpastian
            $table->text('ketidakpastian_in')->nullable();
            $table->text('ketidakpastian_en')->nullable();

            // 🔹 Limit deteksi
            $table->string('limitdeteksi_in', 30)->nullable();
            $table->string('limitdeteksi_en', 30)->nullable();

            // 🔹 Satuan & kondisi simulasi
            $table->string('satuan_in', 255)->nullable();
            $table->string('satuan_en', 255)->nullable();
            $table->string('simulan_in', 255)->nullable();
            $table->string('simulan_en', 255)->nullable();
            $table->string('suhu_in', 255)->nullable();
            $table->string('suhu_en', 255)->nullable();
            $table->string('waktu_in', 255)->nullable();
            $table->string('waktu_en', 255)->nullable();

            // 🔹 Metadata input
            $table->string('nip_input', 30)->nullable();
            $table->dateTime('tgl_input')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hasil_ujis');
    }
};
