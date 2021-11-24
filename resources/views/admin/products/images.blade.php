@extends('layouts.master')

@section('title')
    Products Images
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
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <form action="{{ route('products.index') }}" method="GET">
                                {{-- @csrf --}}
                                <div class="input-group">
                                    <input name="keyword" value="{{ request()->get('keyword') }}" type="search"
                                        class="form-control" placeholder="Pencarian">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        {{-- @can('tag_create') --}}
                        {{-- @dd($productID) --}}
                        <div class="col-md-6">
                            <a href="{{ route('products.addimages',$productID) }}" class="btn btn-primary float-right" >
                                    {{-- {{ trans('tags.button.create.value') }} --}}
                                Product Images
                                <i class="fas fa-plus"></i>
                            </a>
                            <a href="{{ url('admin/products/'.$productID.'/add-images') }}" class="btn btn-primary float-right" role="button">
                            </a>
                        </div>
                        {{-- @endcan --}}
                    </div>
        
                    
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    @include('admin.partials.flash', ['$errors' => $errors])
        
                    <table class="table table-bordered">
                        <thead>
                            <tr align="center">
                                <th>#</th>
                                <th>Images</th>
                                <th>Uploaded At</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($productImages as $image)
                                <tr align="center">
                                    {{-- <td>{{ $index+1}}</td> --}}
                                    <td>{{ $image->id ?? '' }}</td>
                                    <td><img src="{{ asset('storage/'.$image->path)}}" style="width: 150px" alt=""></td>
                                    <td>{{ $image->created_at ?? '' }}</td>
                                    {{-- <td>{{ $image->parent->name ?? '-' }}</td> --}}
                                    <td>
                                        <form class="d-inline" role="alert"
                                            action="{{ route('products.deleteimages',$image->id) }}" method="POST"
                                            alert-title="Hapus product" alert-message="Hapus image"
                                            alert-btn-cancel="Batal" alert-btn-ok="Hapus">
        
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                Hapus
                                            </button>
                                        </form>
                                        {{-- <i class="fas fa-trash"></i> --}}
        
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5">No records found</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
        
                {{-- @if ($products->hasPages())
                    <div class="card-footer clearfix">
                        <ul class="pagination pagination-sm m-0 float-right">
                            {{ $products->links('pagination::bootstrap-4') }}
                        </ul>
                    </div>
                @endif --}}
        
            </div>
        </div>
    </div>
   
</div>

@endsection

@push('javascript-internal')
<script>
    $(document).ready(function(){
        //event : delete Product
        $("form[role='alert']").submit(function (event) {
            event.preventDefault();
            Swal.fire({
                title: $(this).attr('alert-title'),
                text: $(this).attr('alert-message'),
                icon: 'warning',
                allowOutsideClick: false,
                showCancelButton: true,
                cancelButtonText: $(this).attr('alert-btn-cancel'),
                reverseButtons: true,
                confirmButtonText: $(this).attr('alert-btn-ok'),
                }).then((result) => {
                if (result.isConfirmed) {
                    // todo: process of deleting categories
                    event.target.submit();
                }
            });
        });
    })
</script>
    
@endpush