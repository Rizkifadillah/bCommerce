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
    $disableInput = !empty($attribute) ? true : false;

@endphp
<div class="container-fluid">
    <div class="row">
        {{-- <div class="col-md-4">
            @include('admin.products.menus')
        </div> --}}
        <div class="col-md-8">
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">{{ $formTitle}} Category</h3>
                </div>
                <div class="card-body">
                    @include('admin.partials.flash', ['$errors' => $errors])
                    @if (!empty($attribute))
                        {!! Form::model($attribute, ['url' => ['admin/attributes', $attribute->id], 'method' => 'PUT']) !!}
                        {!! Form::hidden('id') !!}
                        {{-- {!! Form::hidden('type') !!} --}}
                    @else
                        {!! Form::open(['url' => 'admin/attributes']) !!}
                    @endif
                        
                    <fieldset class="form-group">
                        <div class="row">
                            <div class="col-lg-12">
                                <legend class="col-form-label pt-0">General</legend>
                                <div class="form-group">
                                    {!! Form::label('code', 'Code') !!}
                                    {!! Form::text('code', null, 
                                        ['class' => 'form-control', 'readonly' => $disableInput]) 
                                    !!}
                                </div>
                                <div class="form-group">
                                    {!! Form::label('name', 'Name') !!}
                                    {!! Form::text('name', null, ['class' => 'form-control']) !!}
                                </div>
                                <div class="form-group">
                                        {!! Form::label('type', 'Type') !!}
                                        {!! Form::select('type', $types , null, 
                                            ['class' => 'form-control', 'placeholder' => '-- Set Type --', 
                                             'readonly' => $disableInput]) 
                                        !!}
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="form-group">
                        <div class="row">
                            <div class="col-lg-12">
                                <legend class="col-form-label pt-0">Validation</legend>
                                <div class="form-group">
                                        {!! Form::label('is_required', 'Is Required?') !!}
                                        {!! Form::select('is_required', $booleanOptions , null, 
                                            ['class' => 'form-control', 'placeholder' => '']) !!}
                                </div>
                                <div class="form-group">
                                        {!! Form::label('is_unique', 'Is Unique?') !!}
                                        {!! Form::select('is_unique', $booleanOptions , null, 
                                            ['class' => 'form-control', 'placeholder' => '']) !!}
                                </div>
                                <div class="form-group">
                                        {!! Form::label('validation', 'Validation') !!}
                                        {!! Form::select('validation', $validations , null, 
                                            ['class' => 'form-control', 'placeholder' => '']) !!}
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="form-group">
                            <div class="row">
                                <div class="col-lg-12">
                                    <legend class="col-form-label pt-0">Configuration</legend>
                                    <div class="form-group">
                                            {!! Form::label('is_configurable', 'Use in Configurable Product?') !!}
                                            {!! Form::select('is_configurable', $booleanOptions , null, 
                                                ['class' => 'form-control', 'placeholder' => '']) !!}
                                    </div>
                                    <div class="form-group">
                                            {!! Form::label('is_filterable', 'Use in Filtering Product?') !!}
                                            {!! Form::select('is_filterable', $booleanOptions , null, 
                                                ['class' => 'form-control', 'placeholder' => '']) !!}
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    <div class="form-footer pt-5 border-top">
                        <button type="submit" class="btn btn-primary btn-default">Save</button>
                        <a href="{{ url('admin/attributes') }}" class="btn btn-secondary btn-default">Back</a>
                    </div>
                {!! Form::close() !!}
                </div>
           
              </div>
        </div>

    </div>
     
</div><!--/. container-fluid -->
@endsection

