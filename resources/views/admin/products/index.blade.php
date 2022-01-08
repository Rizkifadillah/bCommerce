@extends('layouts.master')

@section('title')
    Products
@endsection

@section('breadcumbs')
    <h6>
        {{ Breadcrumbs::render('products') }}
    </h6>
@endsection


@section('content')
<div class="container-fluid">
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
                <div class="col-md-6">
                    @can('add_products')
                    <a href="{{ route('products.create') }}" class="btn btn-primary float-right" role="button">
                        {{-- {{ trans('tags.button.create.value') }} --}}
                        Tambah product
                        <i class="fas fa-plus"></i>
                    </a>
                    @endcan
                </div>
                {{-- @endcan --}}
            </div>

            
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            @include('admin.partials.flash', ['$errors' => $errors])

            <table class="table table-bordered table-sm">
                <thead>
                    <tr align="center">
                        <th>#</th>
                        <th>SKU</th>
                        <th>Type</th>
                        <th>Nama</th>
                        <th>Price</th>
                        <th>Stok</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($products as $index => $product)
                        <tr align="center">
                            {{-- @if (Auth::user()->role == "guru") --}}
                            <td>{{ $index+1}}</td>
                                
                            {{-- @else --}}
                                
                            {{-- <td>{{ $products->firstItem() + $index }}</td> --}}
                            {{-- @endif --}}
                            <td>{{ $product->sku ?? '' }}</td>
                            <td>{{ $product->type }}</td>
                            <td>{{ $product->name ?? '' }}</td>
                            <td>{{ $product->price ?? '' }}</td>
                            <td>{{ $product->productInventory->qty ?? ''}}</td>
                            <td>
                                @if ($product->status_label() == 'active')
                                    <a href="#" class="btn btn-sm btn-success">{{ $product->status_label() }}</a>
                                @elseif($product->status_label() == 'inactive')
                                    <a href="#" class="btn btn-sm btn-danger">inactive</a>
                                @elseif($product->status_label() == 'draft')
                                    <a href="#" class="btn btn-sm btn-warning">draft</a>
                                @endif
                            </td>
                            {{-- <td>{{ $product->parent->name ?? '-' }}</td> --}}
                            <td>
                                <a href="{{ route('products.edit', ['product' => $product->id]) }}" class="btn btn-sm btn-info"
                                    role="button">
                                    Edit
                                </a>

                                <form class="d-inline" role="alert"
                                    action="{{ route('products.destroy', ['product' => $product->id]) }}" method="POST"
                                    alert-title="Hapus product" alert-message="Hapus product {{ $product->name ?? '' }}"
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

        @if ($products->hasPages())
            <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                    {{ $products->links('pagination::bootstrap-4') }}
                </ul>
            </div>
        @endif

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