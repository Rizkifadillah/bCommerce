@extends('layouts.master')

@section('title')
    Products Images Form
@endsection

@section('breadcumbs')
    <h6>
        {{ Breadcrumbs::render('products') }}
    </h6>
@endsection


@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                @include('admin.products.menus')
            </div>
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header card-header-border-bottom">
                        <h2>Upload Images</h2>
                    </div>
                    <div class="card-body">
                        @include('admin.partials.flash', ['$errors' => $errors])

                        <form action="{{ route('products.uploadimage',$productID)}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                {!! Form::label('image', 'Product Image') !!}
                                {!! Form::file('image', ['class' => 'form-control-file', 'placeholder' => 'product image']) !!}
                            </div>
                            <div class="form-footer pt-5 border-top">
                                <button type="submit" class="btn btn-primary btn-default">Save</button>
                                <a href="{{ route('products.images',$productID)}}" class="btn btn-secondary btn-default">Back</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection