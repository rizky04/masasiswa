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
        Schema::create('data_hasil_ujis', function (Blueprint $table) {
             $table->id();
             $table->text('nama_hasil_uji');
              $table->text('jenis_program_uji');
             $table->unsignedBigInteger('id_pcanalisa');
            $table->foreign('id_pcanalisa')->references('id_pcanalisa')->on('pcanalisa')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_hasil_ujis');
    }
};
