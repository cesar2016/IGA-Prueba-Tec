<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'description',
        'date_init',
        'date_end',
        'amount',
        'url_image',
    ];

    /**
     * Define la relación: Un curso tiene muchos pagos.
     */
    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    /**
     * Define la relación: Un curso tiene muchas 'manejos' o 'inscripciones' (HandleCourse).
     * Esto te permitirá acceder a todos los registros de handle_courses asociados a este curso.
     */
    public function handleCourses()
    {
        // 'id_course' es la clave foránea en la tabla 'handle_courses' que apunta a 'courses.id'
        return $this->hasMany(HandleCourse::class, 'id_course');
    }

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'date_init' => 'datetime',
        'date_end' => 'datetime',
    ];

    /**
     * Accesorio para calcular el estado general del curso.
     *
     * @return string
     */
    public function getCourseStatusAttribute(): string
    {
        $currentDate = Carbon::now();

        // Si date_init o date_end son nulos (aunque con 'casts' a datetime deberían ser Carbon o null)
        // se maneja para evitar errores.
        // Carbon::parse($this->date_init) ya manejará el casting si es una string.
        // Si el campo ya está casteado a 'datetime' con $casts, $this->date_init ya será un objeto Carbon o null.
        $dateInit = $this->date_init;
        $dateEnd = $this->date_end;

        if ($dateInit === null || $dateEnd === null) {
            return 'Fechas no definidas'; // O algún otro estado por defecto
        }

        if ($currentDate->lessThan($dateInit)) {
            return 'En espera';
        } elseif ($currentDate->greaterThanOrEqualTo($dateInit) && $currentDate->lessThanOrEqualTo($dateEnd)) {
            return 'Iniciado';
        } else {
            return 'Finalizado';
        }
    }

    /**
     * The accessors to append to the model's array form.
     * Esto hace que 'course_status' esté disponible en la respuesta JSON de forma automática.
     *
     * @var array
     */
    protected $appends = ['course_status'];
}
