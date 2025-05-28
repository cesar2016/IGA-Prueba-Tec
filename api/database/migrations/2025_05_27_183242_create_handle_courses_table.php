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
        Schema::create('handle_courses', function (Blueprint $table) {
            $table->id(); // Columna 'id' autoincremental, clave primaria

            // Claves foráneas (foreign keys)
            $table->foreignId('id_course')->constrained('courses')->onDelete('cascade');
            $table->foreignId('id_user')->constrained('users')->onDelete('cascade'); // Asumiendo que tienes una tabla 'users'
            $table->foreignId('id_payment')->nullable()->constrained('payments')->onDelete('set null'); // Un pago puede no ser obligatorio al crear el registro, o asociarse después

            $table->date('date_init'); // Fecha de inicio de esta 'instancia' o 'inscripción' del curso
            $table->date('date_end');   // Fecha de fin de esta 'instancia' del curso
            $table->string('status')->default('pending'); // 'pending', 'active', 'completed', 'cancelled', etc.

            $table->timestamps(); // created_at y updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('handle_courses');
    }
};
