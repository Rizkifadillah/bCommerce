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

    <div class="row">
        <div class="col-lg-5">
            @include('admin.attributes.option_form')
        </div>

        <div class="col-lg-7">
            <div class="card">
                <div class="card-header">
                    <h2>Options for : {{ $attribute->name }}</h2>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    {{-- @include('admin.partials.flash', ['$errors' => $errors]) --}}
        
                    <table class="table table-bordered">
                        <thead>
                            <tr align="center">
                                <th>#</th>
                                <th>Nama</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($attribute->attributeOptions as $index => $option)
                                <tr align="center">
                                    <td>{{ $index+1}}</td>
                                    <td>{{ $option->name ?? '' }}</td>
                                    <td>
                                        <a href="{{ route('attributes.editoption',$option->id) }}" class="btn btn-sm btn-warning"
                                            role="button">
                                            Edit
                                        </a>
                                        <form class="d-inline" role="alert"
                                            action="{{ route('attributes.deleteoption', ['optionID' => $option->id]) }}" method="POST"
                                            alert-title="Hapus attribute" alert-message="Hapus attribute {{ $option->name ?? '' }}"
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