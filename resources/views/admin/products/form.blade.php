@extends('layouts.master')

@section('title')

@php
    $formTitle = !empty($product) ? 'Update' : 'Add';
@endphp
    {{$formTitle}} Product
@endsection

@section('breadcumbs')
    <h6>
        @if (!empty($product))
        {{ Breadcrumbs::render('edit_product_name',$product) }}
        @else
        {{ Breadcrumbs::render('add_product') }}
        @endif
    </h6>
@endsection



@section('content')

@php
    $formTitle = !empty($product) ? 'Update' : 'Add';
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            @include('admin.products.menus')
        </div>
        <div class="col-md-8">
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">{{ $formTitle}} Category</h3>
                </div>
                <div class="card-body">
                    @include('admin.partials.flash', ['$errors' => $errors])
                    @if (!empty($product))
                        {!! Form::model($product, ['url' => ['admin/products', $product->id], 'method' => 'PUT']) !!}
                        {!! Form::hidden('id') !!}
                        {{-- {!! Form::hidden('type') !!} --}}
                    @else
                        {!! Form::open(['url' => 'admin/products']) !!}
                    @endif
                        {{-- <div class="form-group">
                            {!! Form::label('type', 'Type') !!}
                            {!! Form::select(
                                'type', $types ,
                                !empty($product) ? $product->type : null, 
                                ['class' => 'form-control product-type', 
                                 'placeholder' => '-- Choose Product Type --', 
                                 'disabled' => !empty($product)]) 
                            !!}
                        </div> --}}
                        <div class="form-group">
                            {!! Form::label('sku', 'SKU') !!}
                            {!! Form::text('sku', null, ['class' => 'form-control', 'placeholder' => 'sku']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('name', 'Name') !!}
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'name']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('price', 'Price') !!}
                            {!! Form::text('price', null, ['class' => 'form-control', 'placeholder' => 'price']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('category_ids', 'Category') !!}
                            {!! General::selectMultiLevel(
                                'category_ids[]', $categories, 
                                ['class' => 'form-control', 
                                 'multiple' => true , 
                                 'selected' => !empty(old('category_ids')) ? old('category_ids') : $categoryIDs, 
                                 'placeholder' => '-- Choose Category --']) 
                            !!}
                            {{-- {!! General::selectMultiLevel(
                                'parent_id[]', $categories,
                                ['class' => 'form-control', 
                                 'selected' => !empty(old('parent_id')) ? old('parent_id') : (!empty($category['parent_id']) ? $category['parent_id'] : ''), 
                                 'placeholder' => '__Choose Category__'
                                ])
                            !!} --}}
                        </div>
                        
                        {{--  --}}
                        <div class="form-group">
                            {!! Form::label('short_description', 'Short Description') !!}
                            {!! Form::textarea(
                                'short_description', null, 
                                ['class' => 'form-control', 'placeholder' => 'short description']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('description', 'Description') !!}
                            {!! Form::textarea(
                                'description', null, 
                                ['class' => 'form-control', 'placeholder' => 'description']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('weight', 'Weight') !!}
                            {!! Form::text('weight', null, ['class' => 'form-control', 'placeholder' => 'weight']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('length', 'Length') !!}
                            {!! Form::text('length', null, ['class' => 'form-control', 'placeholder' => 'length']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('width', 'width') !!}
                            {!! Form::text('width', null, ['class' => 'form-control', 'placeholder' => 'width']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('height', 'Height') !!}
                            {!! Form::text('height', null, ['class' => 'form-control', 'placeholder' => 'height']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('status', 'Status') !!}
                            {!! Form::select(
                                'status', $statuses , null, 
                                ['class' => 'form-control', 'placeholder' => '-- Set Status --']) !!}
                        </div>
                        {{--  --}}
                        {{-- <div class="configurable-attributes">
                            @if (!empty($configurableAttributes) && empty($product))
                                <p class="text-primary mt-4">Configurable Attributes</p>
                                <hr/>
                                @foreach ($configurableAttributes as $attribute)
                                    <div class="form-group">
                                        {!! Form::label($attribute->code, $attribute->name) !!}
                                        {!! Form::select(
                                            $attribute->code. '[]', 
                                            $attribute->attributeOptions->pluck('name','id'), null, 
                                            ['class' => 'form-control', 'multiple' => true]) 
                                        !!}
                                    </div>
                                @endforeach
                            @endif
                        </div> --}}

                        {{-- @if ($product)
                            @if ($product->type == 'configurable')
                                @include('admin.products.configurable')
                            @else
                                @include('admin.products.simple')                            
                            @endif

                            <div class="form-group">
                                {!! Form::label('short_description', 'Short Description') !!}
                                {!! Form::textarea(
                                    'short_description', null, 
                                    ['class' => 'form-control', 'placeholder' => 'short description']) !!}
                            </div>
                            <div class="form-group">
                                {!! Form::label('description', 'Description') !!}
                                {!! Form::textarea(
                                    'description', null, 
                                    ['class' => 'form-control', 'placeholder' => 'description']) !!}
                            </div>
                            <div class="form-group">
                                {!! Form::label('status', 'Status') !!}
                                {!! Form::select(
                                    'status', $statuses , null, 
                                    ['class' => 'form-control', 'placeholder' => '-- Set Status --']) !!}
                            </div>
                        @endif --}}
                        <div class="form-footer pt-5 border-top">
                            <button type="submit" class="btn btn-primary btn-default">Save</button>
                            <a href="{{ route('products.index') }}" class="btn btn-secondary btn-default">Back</a>
                        </div>
                    {!! Form::close() !!}
                </div>
           
              </div>
        </div>

    </div>
     
</div><!--/. container-fluid -->
@endsection

