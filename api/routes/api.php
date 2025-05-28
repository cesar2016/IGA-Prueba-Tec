<?php

use App\Http\Controllers\CoursesController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/', function () {

    return response()->json([ "Welcome -- Dev. Cesar Sanchez ".date("d-m-Y") ], 200);
});


// # Routes Courses
Route::get('test_connection', [TestController::class, 'test_connection']);
Route::get('getAllCourses', [CoursesController::class, 'getAllCourses']);
Route::get('getAllCoursesAndPay', [CoursesController::class, 'getAllCoursesAndPay']);
Route::get('getCourseById/{id}', [CoursesController::class, 'getCourseById']);

// Pay
Route::post('coursePay', [PaymentController::class, 'processPayment']);
Route::get('getPayById/{id}', [PaymentController::class, 'getPayById']);




Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
