<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\Frontend\OrderController;

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

Route::get('/localization/{language}',App\Http\Controllers\LocalizationController::class)->name('localization.switch');


Route::get('/', [\App\Http\Controllers\Frontend\HomeController::class, 'index'])->name('home.index');
Route::get('/products', [\App\Http\Controllers\Frontend\ProductController::class, 'index'])->name('product.home');
Route::get('/product/{slug}', [\App\Http\Controllers\Frontend\ProductController::class, 'show'])->name('product.show');
Route::get('/products/quick-view/{slug}', [\App\Http\Controllers\Frontend\ProductController::class, 'quickView']);


Route::get('/carts', [\App\Http\Controllers\Frontend\CartController::class, 'index'])->name('carts.index');
Route::get('/carts/remove/{cartID}', [\App\Http\Controllers\Frontend\CartController::class, 'destroy'])->name('carts.destroy');
Route::post('/carts', [\App\Http\Controllers\Frontend\CartController::class, 'store'])->name('carts.store');
Route::post('/carts/update', [\App\Http\Controllers\Frontend\CartController::class, 'update'])->name('carts.update');

Route::get('orders/checkout', [\App\Http\Controllers\Frontend\OrderController::class, 'checkout']);
Route::post('orders/checkout', [\App\Http\Controllers\Frontend\OrderController::class, 'doCheckout']);
Route::post('orders/shipping-cost', [\App\Http\Controllers\Frontend\OrderController::class, 'shippingCost']);
Route::post('orders/set-shipping', [\App\Http\Controllers\Frontend\OrderController::class, 'setShipping']);
Route::get('orders/received/{orderID}', [\App\Http\Controllers\Frontend\OrderController::class, 'received']);
Route::get('orders/complete', [\App\Http\Controllers\Frontend\OrderController::class, 'complete']);
Route::get('orders/invoice', [\App\Http\Controllers\Frontend\OrderController::class, 'invoice']);
Route::get('orders/cities', [\App\Http\Controllers\Frontend\OrderController::class, 'cities']);
Route::get('orders', [\App\Http\Controllers\Frontend\OrderController::class, 'index']);
Route::get('orders/{orderID}', [\App\Http\Controllers\Frontend\OrderController::class, 'show']);

Route::post('payments/notification', [\App\Http\Controllers\Frontend\PaymentController::class, 'notification']);
Route::get('payments/completed', [\App\Http\Controllers\Frontend\PaymentController::class, 'completed']);
Route::get('payments/failed', [\App\Http\Controllers\Frontend\PaymentController::class, 'failed']);
Route::get('payments/unfinish', [\App\Http\Controllers\Frontend\PaymentController::class, 'unfinish']);

Route::resource('favorites', \App\Http\Controllers\Frontend\FavoriteController::class);

Route::get('profile', [\App\Http\Controllers\Auth\ProfileController::class , 'index']);
Route::post('profile', [\App\Http\Controllers\Auth\ProfileController::class , 'update']);



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

        Route::get('orders/trashed', [\App\Http\Controllers\OrderController::class , 'trashed'])->name('orders.trashed');
		Route::get('orders/restore/{orderID}', [\App\Http\Controllers\OrderController::class ,'restore']);
        Route::resource('/orders', \App\Http\Controllers\OrderController::class);
        Route::get('orders/{orderID}/cancel', [\App\Http\Controllers\OrderController::class , 'cancel']);
		Route::put('orders/cancel/{orderID}', [\App\Http\Controllers\OrderController::class , 'doCancel']);
		Route::post('orders/complete/{orderID}', [\App\Http\Controllers\OrderController::class , 'doComplete']);

        Route::resource('/shipments', \App\Http\Controllers\ShipmentController::class);

        Route::resource('slides', \App\Http\Controllers\SlideController::class);
		Route::get('slides/{slideID}/up', [\App\Http\Controllers\SlideController::class, 'moveUp']);
		Route::get('slides/{slideID}/down', [\App\Http\Controllers\SlideController::class, 'moveDown']);

        Route::get('reports/revenue', [\App\Http\Controllers\ReportController::class, 'revenue']);
		Route::get('reports/product', [\App\Http\Controllers\ReportController::class, 'product']);
		Route::get('reports/inventory', [\App\Http\Controllers\ReportController::class, 'inventory']);
		Route::get('reports/payment', [\App\Http\Controllers\ReportController::class, 'payment']);

        Route::get('/roles/select',[\App\Http\Controllers\RoleController::class,'select'])->name('roles.select');
        Route::resource('roles', \App\Http\Controllers\RoleController::class);
        
        Route::resource('users', \App\Http\Controllers\UserController::class);
    }
);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
