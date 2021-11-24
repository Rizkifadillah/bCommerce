<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::group(
    ['prefix' => 'admin', 'middleware' => ['auth']],
    function(){
        Route::get('/dashboard', [\App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard.index');

        //route categories
        Route::resource('/categories', \App\Http\Controllers\CategoryController::class);

        //Route products
        Route::resource('/products', \App\Http\Controllers\ProductController::class);
        Route::get('/products/{productID}/images', [\App\Http\Controllers\ProductController::class, 'images'])->name('products.images');
        Route::get('/products/{productID}/add-images', [\App\Http\Controllers\ProductController::class, 'addImages'])->name('products.addimages');
        Route::post('/products/images/{productID}', [\App\Http\Controllers\ProductController::class, 'uploadImages'])->name('products.uploadimage');
        Route::delete('/products/images/{imageID}', [\App\Http\Controllers\ProductController::class, 'imagesDelete'])->name('products.deleteimages');

        Route::resource('/attributes', \App\Http\Controllers\AttributeController::class);
        Route::get('attributes/{attributeID}/options', [\App\Http\Controllers\AttributeController::class , 'options'])->name('attributes.option');
        Route::get('attributes/{attributeID}/add-option', [\App\Http\Controllers\AttributeController::class , 'addOption'])->name('attributes.addoption');
        Route::post('attributes/options/{attributeID}', [\App\Http\Controllers\AttributeController::class , 'storeOption'])->name('attributes.storeoption');
        Route::delete('attributes/options/{optionID}', [\App\Http\Controllers\AttributeController::class , 'removeOption'])->name('attributes.deleteoption');
        Route::get('attributes/options/{optionID}/edit', [\App\Http\Controllers\AttributeController::class , 'editOption'])->name('attributes.editoption');
        Route::put('attributes/options/{optionID}', [\App\Http\Controllers\AttributeController::class , 'updateOption'])->name('attributes.updateoption');

    }
);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
