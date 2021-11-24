@extends('layouts.master')

@section('title')

@php
    $formTitle = !empty($category) ? 'Update' : 'Add';
@endphp
    {{$formTitle}} Category
@endsection

@section('breadcumbs')
    <h6>
        @if (!empty($category))
        {{ Breadcrumbs::render('edit_category_name',$category) }}
        @else
        {{ Breadcrumbs::render('add_category') }}
        @endif
    </h6>
@endsection

@section('content')

@php
    $formTitle = !empty($category) ? 'Update' : 'Add';
@endphp
<div class="container-fluid">
      <div class="card card-secondary">
        <div class="card-header">
          <h3 class="card-title">{{ $formTitle}} Category</h3>
        </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card m-2">
                       <div class="card-body">
                           @include('admin.partials.flash', ['$errors' => $errors])
                           @if (!empty($category))
                               {!! Form::model($category, ['url' => ['admin/categories', $category->id], 'method' => 'PUT']) !!}
                               {!! Form::hidden('id') !!}
                            @else
                                {!! Form::open(['route' => 'categories.store']) !!}
                            @endif
                                    <!-- title -->
                                    <div class="form-group">
                                        {!! Form::label('name', 'Name') !!}
                                        {!! Form::text('name', null, ['class' => 'form-control',' placeholder' => 'Category Name']) !!}
                                    </div> 

                                    <div class="form-group">
                                        {!! Form::label('parent_id', 'Parent') !!}
                                        {!! General::selectMultiLevel(
                                            'parent_id', $categories,
                                            ['class' => 'form-control', 
                                             'selected' => !empty(old('parent_id')) ? old('parent_id') : (!empty($category['parent_id']) ? $category['parent_id'] : ''), 
                                             'placeholder' => '__Choose Category__'
                                            ])
                                        !!}
                                    </div> 
                                    <div class="form-footer pt-5 border-top">
                                        {{-- <button type="submit" class="btn btn-primary">Save</button> --}}
                                        {!! Form::submit('Save') !!}
                                    </div>    
                            {!! Form::close() !!}
                             
                       </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card m-2">
                       <div class="card-body">
                          <div class="row d-flex align-items-stretch">
                             <div class="col-md-12">

                             </div>
                          </div>
                          
                        </div>
                    </div>
                    <br>
                    <div class="row mr-6 mb-2">
                       <div class="col-md-12">
                          <div class="float-right">
                             <a class="btn btn-warning px-4" href="{{ route('categories.index')}}">
                                 Kembali
                             </a>
                             <button type="submit" class="btn btn-primary px-4">
                                Simpan
                            </button>
                          </div>
                       </div>
                    </div>
                </div>
            </div>
          {{-- </form> --}}
   
      </div>
</div><!--/. container-fluid -->
@endsection

