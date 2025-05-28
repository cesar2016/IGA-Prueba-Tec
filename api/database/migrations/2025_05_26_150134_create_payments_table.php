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
        Schema::create('payments', function (Blueprint $table) {
            $table->id(); // ID primario, auto-incrementable (alias de bigIncrements('id'))


            $table->foreignId('user_id')
                  ->nullable()
                  ->constrained() // Asume 'users' como tabla referenciada
                  ->onDelete('set null');


            $table->foreignId('course_id')
                  ->constrained() // Asume 'courses' como tabla referenciada
                  ->onDelete('cascade');

            $table->string('full_name');
            $table->string('email');
            $table->string('phone')->nullable();
            $table->string('card_number_hashed')->nullable();
            $table->string('expiry_month_year')->nullable();
            $table->string('card_holder_name')->nullable();
            $table->string('dni')->nullable();
            $table->string('cvv_hashed')->nullable();
            $table->decimal('amount', 10, 2);
            $table->string('currency', 3)->default('ARS');
            $table->string('status')->default('pending');
            $table->timestamps(); // Columnas created_at y updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
