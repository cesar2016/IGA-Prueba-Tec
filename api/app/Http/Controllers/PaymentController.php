<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function processPayment(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            // 1. Validación de los datos de entrada
            $validatedData = $request->validate([
                'fullName' => 'required|string|max:255',
                'email' => 'required|email|max:255',
                'phone' => 'required|string|max:20', // Puedes ajustar el regex para números de teléfono
                'cardNumber' => 'required|string|min:13|max:16', // Solo números, validar longitud
                'expiryDate' => 'required|string|date_format:Y-m|after_or_equal:today', // YYYY-MM
                'cardHolderName' => 'required|string|max:255',
                'dni' => 'required|string|digits:8', // Exactamente 8 dígitos
                'cvv' => 'required|string|digits_between:3,4', // 3 o 4 dígitos
                'course_id' => 'required|integer|exists:courses,id',
                'amount' => 'required|numeric|min:0.01', // Si el monto viene del frontend
                'user_id' => 'required|integer',
            ]);

            // 2. Procesamiento de la información sensible (TOKENIZACIÓN)
            // ESTO ES LO MÁS IMPORTANTE PARA LA SEGURIDAD
            // En un sistema real, aquí llamarías a tu API del proveedor de pagos (Stripe, Mercado Pago, etc.)
            // y les pasarías el número de tarjeta, CVV, fecha de vencimiento.
            // ELLOS te devolverían un TOKEN de la tarjeta y/o un ID de transacción.
            // NO ALMACENES cardNumber NI CVV directamete.
            $tokenDeTarjeta = 'tok_'.uniqid(); // Esto es un mock, reemplaza con el token real
            $lastFourDigits = substr($validatedData['cardNumber'], -4); // Guardar solo los últimos 4 dígitos

            // Simulación de hash (NO USAR EN PRODUCCIÓN)
            $hashedCvv = hash('sha256', $validatedData['cvv']);

            // 3. Crear el registro en la base de datos (con datos seguros)
            $payment = Payment::create([
                'full_name' => $validatedData['fullName'],
                'email' => $validatedData['email'],
                'phone' => $validatedData['phone'],
                'card_number_hashed' => $lastFourDigits, // Guarda solo los últimos 4 dígitos
                'expiry_month_year' => $validatedData['expiryDate'],
                'card_holder_name' => $validatedData['cardHolderName'],
                'dni' => $validatedData['dni'],
                'cvv_hashed' => $hashedCvv, // No se recomienda almacenar el CVV en absoluto
                'course_id' => $validatedData['course_id'], // No se recomienda almacenar el CVV en absoluto
                'amount' => $validatedData['amount'],
                'user_id' => $validatedData['user_id'],
                'currency' => 'ARS',
                'status' => 'completed', // O 'pending' y luego actualizar después de la confirmación del pago
                // 'payment_provider_token' => $tokenDeTarjeta, // Almacena el token del proveedor
            ]);

            // 4. Devolver una respuesta exitosa
            return response()->json([
                'message' => 'Pago procesado exitosamente',
                'payment' => $payment,
                'token' => $tokenDeTarjeta // Solo para demostración, no devolver el token al cliente en un escenario real
            ], 201); // Código de estado HTTP 201 Created

        } catch (ValidationException $e) {
            // Capturar errores de validación de Laravel
            Log::error('Error de validación en YourPaymentController@store: ' . json_encode($e->errors()));
            return response()->json([
                'message' => 'Los datos proporcionados son inválidos.',
                'errors' => $e->errors()
            ], 422); // Código de estado HTTP 422 Unprocessable Entity
        } catch (\Exception $e) {
            // Capturar cualquier otra excepción
            Log::error('Error en YourPaymentController@store: ' . $e->getMessage());
            return response()->json([
                'message' => 'Ocurrió un error al procesar el pago.',
                'error' => $e->getMessage()
            ], 500); // Código de estado HTTP 500 Internal Server Error
        }
    }

    // Otros métodos (index, show, update, destroy) pueden ser implementados según necesites
    // Ejemplo de show:
    public function show(int $id): \Illuminate\Http\JsonResponse
    {
        try {
            $payment = Payment::findOrFail($id);
            return response()->json(['payment' => $payment], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Pago no encontrado.'], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function getPayById($id)
    {

        $payments = Payment::where('user_id', $id)
            ->with([
                'course' => function ($query) {
                    // Cargar handleCourses DENTRO de la relación 'course'
                    $query->with('handleCourses');
                }
            ])
            ->get();

        $payments->each(function (Payment $payment) {
            $mainHandleCourse = null;

            if ($payment->course) {
                $courseHandleCourses = $payment->course->handleCourses;

                if ($courseHandleCourses->isNotEmpty()) {
                    // Lógica para encontrar el handle_course más relevante
                    $mainHandleCourse = $courseHandleCourses->firstWhere('id_payment', $payment->id);

                    if (!$mainHandleCourse) {
                        $mainHandleCourse = $courseHandleCourses->firstWhere('id_user', $payment->user_id);
                    }

                    if (!$mainHandleCourse) {
                        $mainHandleCourse = $courseHandleCourses->first();
                    }
                }
            }

            if ($mainHandleCourse) {
                $payment->course->handle_course_status_for_this_payment = $mainHandleCourse->status;
                $payment->course->handle_course_start_date_for_this_payment = $mainHandleCourse->date_init;
                $payment->course->handle_course_end_date_for_this_payment = $mainHandleCourse->date_end;
            } else if ($payment->course) {
                $payment->course->handle_course_status_for_this_payment = 'Sin Inscripción';
                $payment->course->handle_course_start_date_for_this_payment = null;
                $payment->course->handle_course_end_date_for_this_payment = null;
            }
        });

        return response()->json($payments);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Payment $payment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Payment $payment)
    {
        //
    }
}
