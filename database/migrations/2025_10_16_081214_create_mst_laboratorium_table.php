<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('mst_laboratorium', function (Blueprint $table) {
            $table->id('id'); // <--- default id big integer
            $table->string('nama_laboratorium', 100);
            $table->string('kode_lab', 20)->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('mst_laboratorium');
    }
};
