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
        Schema::create('pc', function (Blueprint $table) {
            $table->id('id_pc');
            $table->foreignId('id_mst_laboratorium')->constrained('mst_laboratorium');

            // 🔹 Informasi order
            $table->string('no_order', 50);
            $table->date('tgl_order');
            $table->integer('lama_order')->nullable();
            $table->integer('banyak_contoh')->nullable();

            // 🔹 Tujuan pengujian
            $table->string('tujuan_pengujian')->nullable();
            $table->string('tujuan_pengujian_ket')->nullable();

            // 🔹 Bahasa LHU
            $table->enum('bahasa_lhu', ['indonesia', 'inggris', 'indonesia dan inggris'])->default('indonesia');

            // 🔹 Informasi sampling
            $table->date('tgl_samplingmulai')->nullable();
            $table->date('tgl_samplingselesai')->nullable();

            // 🔹 Dokumen dan tambahan
            $table->string('nomor_bapc', 50)->nullable();
            $table->text('keterangan_tambahan')->nullable();

            // 🔹 Data customer (dalam negeri & luar negeri)
            $table->string('badanusaha_customerdn', 10)->nullable();
            $table->string('nama_customer', 255)->nullable();
            $table->string('badanusaha_customerln', 10)->nullable();
            $table->string('alamat_customer', 255)->nullable();
            $table->text('alamatpabrik_customer')->nullable();

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
        Schema::dropIfExists('pc');
    }
};
