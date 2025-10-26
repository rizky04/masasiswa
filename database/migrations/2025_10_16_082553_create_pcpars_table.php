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
        Schema::create('pcpar', function (Blueprint $table) {
            $table->id('id_pcpar');

            // 🔹 Relasi utama
            $table->unsignedBigInteger('id_pcanalisa');
            $table->foreign('id_pcanalisa')->references('id_pcanalisa')->on('pcanalisa')->onDelete('cascade');

            $table->unsignedBigInteger('id_produk')->nullable();
            $table->foreign('id_produk')->references('id')->on('mst_produk')->onDelete('set null');

            $table->unsignedBigInteger('id_parameter')->nullable();
            $table->foreign('id_parameter')->references('id')->on('mst_parameter')->onDelete('set null');

            $table->unsignedBigInteger('id_sub_parameter')->nullable();
            $table->foreign('id_sub_parameter')->references('id')->on('mst_sub_parameter')->onDelete('set null');

            $table->unsignedBigInteger('id_syarat_mutu')->nullable();
            $table->foreign('id_syarat_mutu')->references('id')->on('mst_syarat_mutu')->onDelete('set null');


            // 🔹 Urutan dan jenis data
            $table->integer('urutan')->nullable();
            $table->enum('jenispcpar', ['parameter', 'syaratmutu'])->default('parameter');

            // 🔹 Informasi parameter
            $table->text('nama_parameter_in')->nullable();
            $table->text('nama_parameter_en')->nullable();
            $table->unsignedBigInteger('id_parameterinduk')->nullable();
            $table->unsignedBigInteger('id_parameterdetil_induk')->nullable();

            // 🔹 Informasi harga dan satuan
            $table->string('hargasatuan', 100)->nullable();
            $table->string('satuan_in', 255)->nullable();
            $table->string('satuan_en', 255)->nullable();
            $table->string('limitdeteksi_in', 30)->nullable();
            $table->string('limitdeteksi_en', 30)->nullable();

            // 🔹 Metoda & baku mutu
            $table->text('metoda_in')->nullable();
            $table->text('metoda_en')->nullable();
            $table->text('baku_mutu_in')->nullable();
            $table->text('baku_mutu_en')->nullable();

            // 🔹 Informasi input & penugasan
            $table->string('nip_input', 18)->nullable();
            $table->dateTime('tgl_input')->nullable();
            $table->string('nip_petugas', 30)->nullable();
            $table->dateTime('tgl_penugasan')->nullable();
            $table->text('alasan_perubahan_penugasan')->nullable();

            // 🔹 Validasi & catatan korlab
            $table->dateTime('tgl_analis_selesai')->nullable();
            $table->string('nip_validasikorlab_subkon', 30)->nullable();
            $table->dateTime('tgl_validasikorlab_subkon')->nullable();
            $table->string('catatan_korlab', 255)->nullable();
            $table->dateTime('tgl_catatan_korlab')->nullable();
            $table->string('nip_catatan_korlab', 30)->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pcpar');
    }
};
