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
        Schema::create('courses', function (Blueprint $table) {
            $table->id(); // id (autoIncremental)

            $table->string('title'); // title (varchar por defecto con longitud de 255)
            $table->text('description')->nullable(); // description (TEXT, puede ser nulo)
            $table->dateTime('date_init'); // date_init (fecha_hora)
            $table->dateTime('date_end'); // date_end (fecha_hora)
            $table->integer('amount'); // amount (integer)
            $table->text('url_image')->nullable(); //


            $table->timestamps(); // created_at y updated_at (timestamps)
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
