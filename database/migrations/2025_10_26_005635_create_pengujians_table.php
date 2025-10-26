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
        Schema::create('pengujians', function (Blueprint $table) {
            $table->id();
            $table->text('contoh_uji')->nullable();
            $table->text('data_teknis')->nullable();
            $table->text('program_uji')->nullable();
            $table->text('hasil_uji')->nullable();
            $table->text('kesimpulan')->nullable();
            $table->text('foto')->nullable(); // menyimpan path atau base64 foto
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pengujians');
    }
};
