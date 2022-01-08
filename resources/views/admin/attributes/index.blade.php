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
                @can('add_attributes')
                <div class="col-md-6">
                    <a href="{{ route('attributes.create') }}" class="btn btn-primary float-right" role="button">
                        {{-- {{ trans('tags.button.create.value') }} --}}
                        Tambah attributes
                        <i class="fas fa-plus"></i>
                    </a>
                </div>
                @endcan
            </div>

            
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            @include('admin.partials.flash', ['$errors' => $errors])

            <table class="table table-bordered">
                <thead>
                    <tr align="center">
                        <th>#</th>
                        <th>Code</th>
                        <th>Nama</th>
                        <th>Type</th>
                        <th>Validasi</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($attributes as $index => $attribute)
                        <tr align="center">
                            {{-- @if (Auth::user()->role == "guru") --}}
                            <td>{{ $index+1}}</td>
                                
                            {{-- @else --}}
                                
                            {{-- <td>{{ $products->firstItem() + $index }}</td> --}}
                            {{-- @endif --}}
                            <td>{{ $attribute->code ?? '' }}</td>
                            <td>{{ $attribute->name ?? '' }}</td>
                            <td>{{ $attribute->type ?? '' }}</td>
                            <td>{{ $attribute->validation ?? ''}}</td>
                            {{-- <td>{{ $attribute->parent->name ?? '-' }}</td> --}}
                            <td>
                                <a href="{{ route('attributes.option',$attribute->id) }}" class="btn btn-sm btn-warning"
                                    role="button">
                                    Option
                                </a>
                                @can('edit_attributes')
                                    
                                    <a href="{{ route('attributes.edit', ['attribute' => $attribute->id]) }}" class="btn btn-sm btn-info"
                                        role="button">
                                        Edit
                                    </a>
                                @endcan
                                @can('delete_attributes')
                                    
                                    <form class="d-inline" role="alert"
                                        action="{{ route('attributes.destroy', ['attribute' => $attribute->id]) }}" method="POST"
                                        alert-title="Hapus attribute" alert-message="Hapus attribute {{ $attribute->name ?? '' }}"
                                        alert-btn-cancel="Batal" alert-btn-ok="Hapus">

                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            Hapus
                                        </button>
                                    </form>
                                @endcan
                                {{-- <i class="fas fa-trash"></i> --}}

                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6">No records found</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- @if ($attributes->hasPages())
            <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                    {{ $products->links('pagination::bootstrap-4') }}
                </ul>
            </div>
        @endif --}}

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