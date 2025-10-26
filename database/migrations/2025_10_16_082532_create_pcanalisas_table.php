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
                Schema::create('pcanalisa', function (Blueprint $table) {
            $table->id('id_pcanalisa');
            $table->unsignedBigInteger('id_pc');
            $table->foreign('id_pc')->references('id_pc')->on('pc')->onDelete('cascade');

            $table->foreignId('id_standar_uji')->nullable()->constrained('mst_standar_uji');

            // 🔹 Informasi dasar analisa
            $table->string('nopcanalisa', 40);
            $table->enum('layanan_cepat', ['normal', 'silver', 'gold', 'platinum'])->default('normal');
            $table->integer('spm')->nullable();
            $table->date('tgl_perkiraan_analisaselesai')->nullable();
            $table->enum('jenis_analisa', ['satuan', 'paket'])->default('satuan');

            // 🔹 Data sampling dan dokumen
            $table->text('nomor_bapc')->nullable();
            $table->string('file_bapc', 255)->nullable();
            $table->date('tgl_samplingmulai')->nullable();
            $table->date('tgl_samplingselesai')->nullable();

            // 🔹 Informasi sampel
            $table->text('namasample_indo')->nullable();
            $table->text('namasample_inggris')->nullable();
            $table->text('merek')->nullable();
            $table->text('tipe_indo')->nullable();
            $table->text('tipe_inggris')->nullable();
            $table->text('keterangan')->nullable();

            // 🔹 File pendukung
            $table->string('filedatadukung', 255)->nullable();

            // 🔹 Produk terkait
            $table->unsignedBigInteger('id_produk')->nullable();
            $table->string('nama_produk', 255)->nullable();

            // 🔹 Status dan pembatalan
            $table->enum('status', ['Diproses', 'Batal'])->default('Diproses');
            $table->string('alasan_batal', 255)->nullable();
            $table->string('filedatadukung_batal', 255)->nullable();
            $table->dateTime('tgl_batal')->nullable();
            $table->string('nip_batal', 30)->nullable();

            // 🔹 Kendala
            $table->string('kendala', 255)->nullable();
            $table->dateTime('tgl_kendala')->nullable();
            $table->string('nip_kendala', 30)->nullable();

            // 🔹 Proses manajer teknis & penanggung jawab
            $table->string('nip_mt', 30)->nullable();
            $table->dateTime('tgl_proses_mt')->nullable();
            $table->string('nip_penanggungjawab', 30)->nullable();
            $table->dateTime('tgl_penanggungjawab')->nullable();

            // 🔹 Penerimaan & penugasan
            $table->dateTime('tgl_terima_korlab')->nullable();
            $table->dateTime('tgl_terima_sample')->nullable();
            $table->dateTime('tgl_penugasan')->nullable();

            // 🔹 Catatan & kesimpulan LHU
            $table->text('lhucatatan_in')->nullable();
            $table->text('lhucatatan_en')->nullable();
            $table->text('lhukesimpulan_in')->nullable();
            $table->text('lhukesimpulan_en')->nullable();

            // 🔹 Validasi LHU
            $table->dateTime('tgl_validasilhu_korlab')->nullable();
            $table->dateTime('tgl_validasilhu_mt')->nullable();
            $table->enum('status_validasilhu_mt', ['setuju', 'tolak', '-'])->default('-');
            $table->text('ket_validasilhu_mt')->nullable();

            // 🔹 Informasi sertifikasi & hasil uji
            $table->enum('kan', ['ya', 'tidak'])->default('tidak');
            $table->string('foto', 255)->nullable();
            $table->string('template_lhu', 255)->nullable();
            $table->enum('limitdeteksi', ['ya', 'tidak'])->default('tidak');

            // 🔹 Penandatangan & cetak LHU
            $table->string('nip_penandatangan', 30)->nullable();
            $table->dateTime('tgl_cetaklhu')->nullable();
            $table->string('nip_cetaklhu', 30)->nullable();
            $table->string('filelhu', 255)->nullable();

            // 🔹 Upload & pengarsipan
            $table->dateTime('tgl_upload')->nullable();
            $table->string('nip_upload', 30)->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pcanalisas');
    }
};
