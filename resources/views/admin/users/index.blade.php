@extends('layouts.master')

@section('title')
{{ trans('users.title.index')}}
@endsection

@section('breadcumbs')
  {{ Breadcrumbs::render('users') }}

@endsection
@section('content')
 <div class="row">
    <div class="col-md-12">
       <div class="card">
          <div class="card-header">
             <div class="row">
                <div class="col-md-6">
                   <form action="{{ route('users.index')}} " method="GET">
                      <div class="input-group">
                         <input name="keyword" value="{{ request()->get('keyword')}}" type="search" class="form-control" placeholder="">
                         <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                               <i class="fas fa-search"></i>
                            </button>
                         </div>
                      </div>
                   </form>
                </div>
                <div class="col-md-6">
                   <a href="{{ route('users.create')}}" class="btn btn-primary float-right" role="button">
                      {{ trans('users.button.create.value') }}
                      <i class="fas fa-plus-square"></i>
                   </a>
                </div>
             </div>
          </div>
          <div class="card-body">
             <div class="row">
                <!-- list users -->
                @forelse ($users as $user)
                    <div class="col-md-6">
                        <div class="card my-1">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-1">
                                        <i class="mdi mdi-star fa-5x"></i>
                                    </div>
                                    <div class="col-md-1">
                                    <table>
                                        <tr>
                                            <th>
                                                {{ trans('users.label.name') }}
                                            </th>
                                            <td>:</td>
                                            <td>
                                                <!-- show user name -->
                                                {{ $user->first_name}}  {{ $user->last_name}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                {{ trans('users.label.email') }}
                                            </th>
                                            <td>:</td>
                                            <td>
                                                <!-- show user email -->
                                                {{ $user->email}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                {{ trans('users.label.role') }}
                                            </th>
                                            <td>:</td>
                                            <td>
                                                <!-- Show user roles -->
                                                {{ $user->roles->first()->name ?? ''}}
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                </div>
                                <div class="float-right">
                                    <!-- edit -->
                                    @can('edit_users')
                                        <a href="{{ route('users.edit',['user' => $user])}}" class="btn btn-sm btn-info" role="button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    @endcan
                                    <!-- delete -->
                                    @can('delete_users')
                                        <form class="d-inline" role="alert" action="{{ route('users.destroy', ['user' => $user])}}" method="POST"
                                            alert-title="{{ trans('users.alert.delete.title')}}" 
                                            alert-message="{{ trans('users.alert.delete.message.confirm', ['name' => $user->name])}}"
                                            alert-btn-cancel="{{ trans('users.button.cancel.value')}}"
                                            alert-btn-ok="{{ trans('users.button.delete.value')}}">
                                            
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    @endcan
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <p>
                        <strong>
                            @if (request()->get('keyword'))
                                {{ trans('users.label.no_data.search', ['keyword' => request()->get('keyword')] )}}
                            @else
                                {{ trans('users.label.no_data.fetch') }}
                            @endif
                            
                        </strong>
                    </p>
                @endforelse
             </div>
          </div>
             <!-- Todo:paginate -->
            @if ($users->hasPages())
                <div class="card-footer">
                    {{ $users->links('vendor.pagination.bootstrap-4')}}
                </div>
            @endif
       </div>
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