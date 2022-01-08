<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use Illuminate\Http\Request;
use App\Models\AttributeOption;
use App\Http\Requests\AttributeRequest;
use Illuminate\Support\Facades\Session;
use RealRashid\SweetAlert\Facades\Alert;
use App\Http\Requests\AttributeOptionRequest;

class AttributeController extends Controller
{

    public function __construct(){

        $this->middleware('permission:view_attributes', ['only' => 'index']);
        $this->middleware('permission:add_attributes', ['only' => ['create', 'store']]);
        $this->middleware('permission:edit_attributes', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete_attributes', ['only' => 'destroy']);

        $this->data['types'] = Attribute::types();
        $this->data['booleanOptions'] = Attribute::booleanOptions();
        $this->data['validations'] = Attribute::validations();
        
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $this->data['attributes'] = Attribute::orderBy('name', 'asc')->paginate(10);

        return \view('admin.attributes.index', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['attributes'] = null;

        return view('admin.attributes.form',$this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AttributeRequest $request)
    {
        $params = $request->except('_token');
        $params['is_required'] = (bool) $params['is_required'];
        $params['is_unique'] = (bool) $params['is_unique'];
        $params['is_configurable'] = (bool) $params['is_configurable'];
        $params['is_filterable'] = (bool) $params['is_filterable'];

        if (Attribute::create($params)) {
            Session::flash('success', 'Attribute has been saved');
            Alert::success('success', 'berhasil menambahkan');
        }

        return \redirect()->route('attributes.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $attribute = Attribute::findOrFail($id);

        $this->data['attribute'] = $attribute;

        return view('admin.attributes.form', $this->data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AttributeRequest $request, $id)
    {
        
        $params = $request->except('_token');
        $params['is_required'] = (bool) $params['is_required'];
        $params['is_unique'] = (bool) $params['is_unique'];
        $params['is_configurable'] = (bool) $params['is_configurable'];
        $params['is_filterable'] = (bool) $params['is_filterable'];

        //di unset tidak bisa diupdate
        unset($params['code']);
        unset($params['type']);

        $attribute = Attribute::findOrFail($id);

        if ($attribute->update($params)) {
            Session::flash('success', 'Attribute has been update');
            Alert::success('success', 'berhasil update');
        }

        return \redirect()->route('attributes.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $attribute = Attribute::findOrFail($id);

        if ($attribute->delete()) {
            Session::flash('success', 'Attribute has been delete');
            Alert::success('success', 'berhasil delete');
        }

        return \redirect()->route('attributes.index');

    }

    public function options($attributeID)
    {
        if (empty($attributeID)) {
            # code...
            return \redirect()->route('attributes.index');
        }

        $attribute = Attribute::findOrFail($attributeID);
        $this->data['attribute'] = $attribute;

        return view('admin.attributes.options', $this->data);
    }

    public function storeOption(AttributeOptionRequest $request, $attributeID)
    {
        if (empty($attributeID)) {
            # code...
            return redirect()->route('attributes.index');
        }    

        $params = [
            'attribute_id' => $attributeID,
            'name' => $request->get('name'),
        ];

        if (AttributeOption::create($params)) {
            # code...
            Session::flash('success', 'Attribute Option has been saved');
            Alert::success('success', 'berhasil saved');
        }

        return redirect()->route('attributes.option',$attributeID);
    }

    public function editOption($attributeID){
        $option = AttributeOption::findOrFail($attributeID);

        $this->data['attributeOption'] = $option;
        $this->data['attribute'] = $option->attribute;

        return view('admin.attributes.options', $this->data);
    }

    public function updateOption(AttributeOptionRequest $request, $optionID)
    {
        $option = AttributeOption::findOrFail($optionID);
        $params = $request->except('_token');

        if ($option->update($params)) {
            # code...
            Session::flash('success', 'Attribute Option has been update');
            Alert::success('success', 'berhasil update');
        }

        return \redirect()->route('attributes.option',$option->attribute_id);
    }

    public function removeOption($optionID){

        if (empty($optionID)) {
            # code...
            return redirect()->route('attributes.index');
        }
        $option = AttributeOption::findOrFail($optionID);
        // dd($option);

        if ($option->delete()) {
            Session::flash('success', 'Attribute Option has been delete');
            Alert::success('success', 'berhasil delete');
        }

        return \redirect()->route('attributes.option',$option->attribute_id);

    }
}
