<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\php\ProductsController;

Route::view('/',"welcome");
// USER ROUTES
Route::get('/user', [UserController::class, "index"]); // Show all users
Route::get('/user/{id}', [UserController::class, "edit"])->name('user.edit'); // edit single user
Route::put('/user/{id}', [UserController::class, "update"])->name('user.update'); // update the user
Route::delete('/user/{id}/delete', [UserController::class, "delete"])->name('user.delete'); // delete single user

// PRODUCT ROUTES
Route::get('/product', [ProductsController::class, "index"]); // Show all products
Route::get('/product/{id}', [ProductsController::class, "edit"])->name('product.edit'); // edit single Produc
Route::put('/product/{id}', [ProductsController::class, "update"])->name('product.update'); // update the product
Route::delete('/product/{id}/delete', [ProductsController::class, "delete"])->name('product.delete'); // delete single product







// Catch all undefined routes
// Route::view("{any}", "welcome")->where("any", ".*");

