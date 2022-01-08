@extends('layouts.master')

@section('title')
    Beranda
@endsection

@section('breadcumbs')
    <h6>
        {{ Breadcrumbs::render('categories') }}
    </h6>
@endsection


@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-6">
                    <form action="{{ route('categories.index') }}" method="GET">
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
                @can('add_categories')
                <div class="col-md-6">
                    <a href="{{ route('categories.create') }}" class="btn btn-primary float-right" role="button">
                        {{-- {{ trans('tags.button.create.value') }} --}}
                        Tambah category
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
                        <th>Nama</th>
                        <th>Slug</th>
                        <th>Parent</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($categories as $index => $category)
                        <tr align="center">
                            {{-- @if (Auth::user()->role == "guru") --}}
                            <td>{{ $index+1}}</td>
                                
                            {{-- @else --}}
                                
                            {{-- <td>{{ $categorys->firstItem() + $index }}</td> --}}
                            {{-- @endif --}}
                            <td>{{ $category->name ?? '' }}</td>
                            <td>{{ $category->slug }}</td>
                            <td>{{ $category->parent->name ?? '-' }}</td>
                            <td>
                                
                                @can('edit_categories')
                                    <a href="{{ route('categories.edit', ['category' => $category->id]) }}" class="btn btn-sm btn-info"
                                        role="button">
                                        {{-- <i class="fas fa-pen"></i> --}}
                                        Edit
                                    </a>
                                @endcan
                                
                                @can('delete_categories')
                                    <form class="d-inline" role="alert"
                                        action="{{ route('categories.destroy', ['category' => $category->id]) }}" method="POST"
                                        alert-title="Hapus category" alert-message="Hapus category {{ $category->name ?? '' }}"
                                        alert-btn-cancel="Batal" alert-btn-ok="Hapus">

                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            {{-- <i class="fas fa-trash"></i> --}}
                                            Hapus
                                        </button>
                                    </form>
                                @endcan

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

        {{-- @if ($categorys->hasPages())
            <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                    {{ $categorys->links('pagination::bootstrap-4') }}
                </ul>
            </div>
        @endif --}}

    </div>
</div>

@endsection

@push('javascript-internal')
<script>
    $(document).ready(function(){
        //event : delete category
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