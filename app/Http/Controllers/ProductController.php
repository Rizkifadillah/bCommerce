<?php

namespace App\Http\Controllers;

use Str;
use Stringable;
use App\Models\Product;
// use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\ProductRequest;
use Illuminate\Support\Facades\Session;
use RealRashid\SweetAlert\Facades\Alert;
use App\Http\Requests\ProductImageRequest;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->data['statuses'] = Product::statuses();
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->data['products'] = Product::orderBy('name', 'asc')->paginate(10);
        return view('admin.products.index',$this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::orderBy('name', 'asc')->get();

        $this->data['categories'] = $categories->toArray();
        $this->data['product'] = null;
        $this->data['productID'] = 0;
        $this->data['categoryIDs'] = [];

        return view('admin.products.form',$this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {
       
        // dd($request);
        DB::beginTransaction();
        try {
            //prosess insert data
            $products = Product::create([
                "sku" => $request->sku,
                "name" => $request->name,
                "price" => $request->price,
                "slug" => Str::slug($request->name),
                "short_description" => $request->short_description,
                "description" => $request->description,
                "weight" => $request->weight,
                "length" => $request->length,
                "width" => $request->width,
                "height" => $request->height,
                "status" => $request->status,
                "user_id" => Auth::user()->id,
            ]);
            // insert Table pivot
            // $products->tags()->attach($request->tag);
            $products->categories()->attach($request->category_ids);

            Session::flash('success', 'Product has been saved');
            Alert::success('success', 'berhasil menambahkan');

            return redirect()->route('products.index');

        } catch (\Throwable $th) {
            //throw $th;
            DB::rollBack();

            Session::flash('error', $th->getMessage());
            Alert::error('Error Title', 'Error Message'. $th->getMessage());

            return redirect()->back();
          
        } finally {
            DB::commit();
        }

        //mengisi semua isian default kecuali _token
        // $params = $request->except('_token');
        // $params['slug'] = Str::slug($params['name']);
        // $params['user_id'] = '1';
        // $saved = false;
        // $saved = DB::transaction(function() use ($request) {
        //     //save semua params ke table product
        //     // $product = Product::create($params);
        //     //relasi produk sesuai kategori
        //     $product->categories()->sync($params['category_ids']);

        //     return true;
        // });

        // if ($saved) {
        //     Session::flash('success', 'Product has been saved');
        // }else{
        //     Session::flash('error', 'Product could not be saved');
        // }
        // return redirect()->route('products.index');
        // // \dd($params);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (empty($id)) {
            return redirect()->route('products.create');
        }
        $product = Product::findOrFail($id);
        $categories = Category::orderBy('name', 'asc')->get();

        $this->data['categories'] = $categories->toArray();
        $this->data['product'] = $product;
        $this->data['productID'] = $product->id;
        $this->data['categoryIDs'] = $product->categories->pluck('id')->toArray();
        // dd($product);

        return \view('admin.products.form',$this->data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ProductRequest $request, $id)
    {
        $product = Product::findOrFail($id);

        DB::beginTransaction();
        try {
            //prosess insert data
            $product->update([
                "sku" => $request->sku,
                "name" => $request->name,
                "price" => $request->price,
                "slug" => Str::slug($request->name),
                "short_description" => $request->short_description,
                "description" => $request->description,
                "weight" => $request->weight,
                "length" => $request->length,
                "width" => $request->width,
                "height" => $request->height,
                "status" => $request->status,
                "user_id" => Auth::user()->id,
            ]);
            //update untuk pivot bukan dengan attach tp dengan sync
            $product->categories()->sync($request->category_ids);

            Session::flash('success', 'Product has been update');
            Alert::success('success', 'berhasil update');

            return redirect()->route('products.index');

            } catch (\Throwable $th) {
            //throw $th;
            DB::rollBack();

            Session::flash('error', $th->getMessage());
            Alert::error('Error Title', 'Error Message'. $th->getMessage());

            return redirect()->back();
            

        } finally {
            DB::commit();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        DB::beginTransaction();
        try {
            //prosess delete datas
            $product->categories()->detach();
            $product->delete();
            //update untuk pivot bukan dengan attach tp dengan sync

            Session::flash('success', 'Product has been delete');
            Alert::success('success', 'berhasil delete');

            return redirect()->route('products.index');

            } catch (\Throwable $th) {
            //throw $th;
            DB::rollBack();
            Session::flash('error', $th->getMessage());
            Alert::error('Error Title', 'Error Message'. $th->getMessage());

            return redirect()->back();
            
        } finally {
            DB::commit();

            return redirect()->back();
        }
    }

    public function images($id){
        if (empty($id)) {
            # code...
            return \redirect()->route('products.create');
        }
        $product = Product::findOrFail($id);

        $this->data['productID'] = $product->id;
        $this->data['productImages'] = $product->productImages;

        return view('admin.products.images',$this->data);
    }


    public function addImages($id)
    {
        if (empty($id)) {
            return redirect('admin/products');
        }

        $product = Product::findOrFail($id);

        $this->data['productID'] = $product->id;
        $this->data['product'] = $product;

        return view('admin.products.image_form', $this->data);
    }

    public function uploadImages(ProductImageRequest $request, $id){

        $product = Product::findOrFail($id);

        if ($request->has('image')){
            $image = $request->file('image');
            $name = $product->slug.'_'.time();

            $fileName = $name . '.' . $image->getClientOriginalExtension();

            $folder = '/uploads/images';

            $filePath = $image->storeAs($folder, $fileName, 'public');

            $params = [
                'product_id' => $product->id,
                'path' => $filePath,
            ];

            if (ProductImage::create($params)) {
                # code...
                Session::flash('success', 'Image has been saved');
                Alert::success('success', 'berhasil menambahkan');
    
            }else{
                Session::flash('error', 'error');
                Alert::error('Error Title', 'Error saved');    
            }

            return \redirect()->route('products.images',$id);

        }

    }

    public function imagesDelete($id){
        $image = ProductImage::findOrFail($id);

        if($image->delete()){
            Session::flash('success', 'Image has been delete');
            Alert::success('success', 'berhasil dihapus');
        }else{
            Session::flash('error', 'error');
            Alert::error('Error Title', 'Error saved');    
        }

        return \redirect()->back();
    }
}
