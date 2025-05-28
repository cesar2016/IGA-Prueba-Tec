<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class HandleCourse extends Model
{
    use HasFactory;

    protected $table = 'handle_courses';

    protected $fillable = [
        'id_course',
        'id_user',
        'id_payment',
        'date_init',
        'date_end',
        'status',
    ];

    public function course()
    {
        return $this->belongsTo(Course::class, 'id_course');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class, 'id_payment');
    }

    /**
     * Accesorio para calcular el estado de esta instancia específica del curso.
     * Basado en date_init y date_end de handle_courses.
     */
    public function getEnrollmentStatusAttribute(): string
    {
        $currentDate = Carbon::now();
        // Asegurarse de que date_init y date_end sean objetos Carbon
        $dateInit = Carbon::parse($this->date_init);
        $dateEnd = Carbon::parse($this->date_end);

        if ($currentDate->lessThan($dateInit)) {
            return 'Próximo'; // La fecha de inicio de esta instancia aún no ha llegado
        } elseif ($currentDate->greaterThanOrEqualTo($dateInit) && $currentDate->lessThanOrEqualTo($dateEnd)) {
            return 'En curso'; // La fecha actual está entre la fecha de inicio y fin
        } else {
            return 'Completado'; // La fecha de fin de esta instancia ya pasó
        }
    }

    protected $appends = ['enrollment_status'];
}
