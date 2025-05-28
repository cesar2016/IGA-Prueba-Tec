<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'course_id',
        'full_name',
        'email',
        'phone',
        'card_number_hashed',
        'expiry_month_year',
        'card_holder_name',
        'dni',
        'cvv_hashed',
        'amount',
        'currency',
        'status',
        // 'created_at' y 'updated_at' generalmente se manejan automáticamente
    ];

    /**
     * Un pago pertenece a un curso.
     * Asumimos que la tabla 'payments' tiene una columna 'course_id'.
     */
    public function course()
    {
        return $this->belongsTo(Course::class, 'course_id');
    }

    /**
     * Un pago pertenece a un usuario.
     * Asumimos que la tabla 'payments' tiene una columna 'user_id'.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Si un pago puede tener una o más inscripciones relacionadas directamente a él
    // (Ej: si handle_courses tiene un id_payment que referencia a payments.id)
    public function handleCourses()
    {
        return $this->hasMany(HandleCourse::class, 'id_payment');
    }



    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}
