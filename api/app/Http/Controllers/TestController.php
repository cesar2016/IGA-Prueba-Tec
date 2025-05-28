<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
   public function test_connection()
   {
        return response()->json(['msg' => 'Conexion Exitosa !!'], 201); // 201 Created
   }
}
