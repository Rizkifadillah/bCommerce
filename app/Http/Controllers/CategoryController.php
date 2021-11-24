<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Requests\CategoryRequest;

use Session;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->data['categories'] = Category::orderBy('name', 'asc')->paginate(10);
        return view('admin.categories.index',$this->data);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::orderBy('name','asc')->get();
        
        $this->data['categories'] = $categories->toArray();
        $this->data['category'] = '';
        // dd($categories);
        
        return view('admin.categories.form',$this->data);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoryRequest $request)
    {
        $params = $request->except('_token');
        // dd($params);exit;
        $params['slug'] = Str::slug($params['name']);

        $params['parent_id'] = (int)$params['parent_id'];

        if(Category::create($params)){
            Session::flash('success', 'Category has been saved');
        }

        return \redirect()->route('categories.index');

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
        $category = Category::findOrFail($id);

        $categories = Category::orderBy('name','asc')->get();
        
        $this->data['categories'] = $categories->toArray();
        $this->data['category'] = $category;

        return view('admin.categories.form',$this->data);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryRequest $request, $id)
    {
        $params = $request->except('_token');
        $params['slug'] = Str::slug($params['name']);

        $category = Category::findOrfail($id);
        if($category->update($params)){
            Session::flash('success', 'Category has been updated');
        }

        return redirect()->route('categories.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        try {
            $category->delete();
            Session::flash('success', 'Product has been saved');

            return redirect()->route('products.index');

        } catch (\Throwable $th) {
            //throw $th;
            Session::flash('error', $th->getMessage());

            return redirect()->back();

        }

        return redirect()->back();

    }
}
