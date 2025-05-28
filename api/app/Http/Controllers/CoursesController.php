<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\HandleCourse;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CoursesController extends Controller
{

    public function getAllCourses()
    {


        $courses = Course::all();
        return response()->json([
            'courses' => $courses
        ], 200);


    }

    public function getCourseById($id)
    {

        $course = Course::findOrFail($id);
        return response()->json([
            'course' => $course
        ], 200); // Código de estado HTTP 200 OK

    }

    public function getAllCoursesAndPay()
    {
        $today = Carbon::today(); // Obtener la fecha de hoy (sin hora)

        $courses = Course::with(['payments'])
                         ->withCount('payments')
                         ->with([
                             'handleCourses' // Cargamos TODOS los handle_courses asociados
                         ])
                         ->get();

        $courses->each(function (Course $course) use ($today) { // Especificar el tipo de $course para mejores sugerencias IDE
            // FILTRO ORIGINAL: handle_courses que YA han iniciado (date_init < today)
            /** @var Collection<int, HandleCourse> $startedHandleCourses */
            $startedHandleCourses = $course->handleCourses->filter(function (HandleCourse $handleCourse) use ($today) {
                return Carbon::parse($handleCourse->date_init)->lessThan($today);
            });

            // **MODIFICACIÓN CLAVE PARA handle_courses_count:**
            // Contar la cantidad de fechas `date_init` distintas
            // donde el status sea 'active' o 'cancelled'.
            $countDistinctInitiatedDates = $course->handleCourses
                ->whereIn('status', ['active', 'cancelled']) // Filtra por status 'active' o 'cancelled'
                ->pluck('date_init')                       // Obtiene solo la columna date_init
                ->unique()                                 // Obtiene solo los valores únicos de date_init
                ->count();                                 // Cuenta cuántos valores únicos hay

            $course->handle_courses_count = $countDistinctInitiatedDates;


            // --- Lógica existente para derivar fechas y estado del curso ---

            // Determinar las fechas de inicio y fin derivadas de las handle_courses iniciadas
            if ($startedHandleCourses->isNotEmpty()) {
                // Obtener la fecha de inicio más temprana
                /** @var Carbon|null $earliestInitDate */
                $earliestInitDate = $startedHandleCourses->min(function (HandleCourse $handleCourse) {
                    return Carbon::parse($handleCourse->date_init);
                });

                // Obtener la fecha de fin más tardía
                /** @var Carbon|null $latestEndDate */
                $latestEndDate = $startedHandleCourses->max(function (HandleCourse $handleCourse) {
                    return Carbon::parse($handleCourse->date_end);
                });

                // Asegurarse de que earliestInitDate y latestEndDate no sean null antes de usarlos
                if ($earliestInitDate && $latestEndDate) {
                    $course->date_init_derived_from_enrollments = $earliestInitDate->toDateTimeString();
                    $course->date_end_derived_from_enrollments = $latestEndDate->toDateTimeString();

                    // Derivar el estado del curso basado en las inscripciones iniciadas
                    $now = Carbon::now();
                    if ($now->lessThan($earliestInitDate)) {
                        $course->course_status_derived_from_enrollments = 'Próximo';
                    } elseif ($now->greaterThanOrEqualTo($earliestInitDate) && $now->lessThanOrEqualTo($latestEndDate)) {
                        $course->course_status_derived_from_enrollments = 'En Curso';
                    } else {
                        $course->course_status_derived_from_enrollments = 'Finalizado';
                    }
                } else {
                    // Caso de fallback si min/max retornan null inesperadamente (aunque ya se chequea isNotEmpty)
                    $course->date_init_derived_from_enrollments = null;
                    $course->date_end_derived_from_enrollments = null;
                    $course->course_status_derived_from_enrollments = 'Error de Cálculo de Estado';
                }

            } else {
                // Si no hay handle_courses iniciadas, establecer fechas y estado como null o 'En espera'
                $course->date_init_derived_from_enrollments = null;
                $course->date_end_derived_from_enrollments = null;
                $course->course_status_derived_from_enrollments = 'En Espera';
            }
            // Las propiedades asignadas directamente serán incluidas en la respuesta JSON.
        });

        return response()->json([
            'courses' => $courses
        ]);
    }


}
