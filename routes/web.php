<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/',[UserController::class,'index'])->name('index');
Route::post("/",[UserController::class,'signup'])->name('signup');
Route::get('/get_state',[UserController::class,'get_state'])->name('get_state');
Route::get('/get_city',[UserController::class,'get_city'])->name('get_city');
Route::get('/edit/{id}',[UserController::class,'edit'])->name('edit');
Route::post('/update',[UserController::class,'update'])->name('update');