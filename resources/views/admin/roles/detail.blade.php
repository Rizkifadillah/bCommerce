@extends('layouts.master')

@section('title')
{{ trans('roles.title.detail')}}
@endsection

@section('breadcumbs')
{{ Breadcrumbs::render('detail_roles_title', $role) }}

@endsection
@section('content')
 <div class="row">
    <div class="col-md-12">
       <div class="card">
          <div class="card-body">
             <div class="form-group">
                <label for="input_role_name" class="font-weight-bold">
                   {{ trans('roles.form_control.input.name.label') }}
                </label>
                <input id="input_role_name" value="{{ $role->name }}" name="name" type="text" class="form-control" readonly />
             </div>
             <!-- permission -->
             <div class="form-group">
                <label for="input_role_permission" class="font-weight-bold">
                   permission
                </label>
                <div class="row">
                   <!-- list manage name:start -->
                   @forelse ($authorities as $manageName => $permissions)
                     <ul class="list-group mx-1">
                        <li class="list-group-item bg-dark text-white">
                           {{ trans("permissions.{$manageName}") }}
                        </li>
                        <!-- list permission:start -->
                        @foreach ($permissions as $permission)
                        <li class="list-group-item h-10">
                           <div class="form-group">
                               <div class="form-check form-check-flat">
                                    <label class="form-check-label">
                                       <input class="form-check-input" type="checkbox"
                                       value="" onclick="return false;" {{ in_array($permission,$rolePermissions) ? "checked" :null }} >
         
                                       {{ trans("permissions.{$permission}") }}
         
                                    </label>
                                   
                                   {{-- <div class="form-check-label">
                                       <input id="{{ $permission }}" class="form-check-input" type="checkbox" value="{{$permission}}">
                                       <label for="{{ $permission}}" class="form-check-label">
                                           {{ trans("permissions.{$permission}") }}
                                       </label>
                                   </div> --}}
                               </div>
                           </div>
                       </li>
                        
                           
                        @endforeach
                        <!-- list permission:end -->
                     </ul>
                   @empty

                   <p>
                      <strong>
                         {{ trans('roles.label.no_data.fetch') }}
                      </strong>
                   </p>
                       
                   @endforelse
                   <!-- list manage name:end  -->
                </div>
             </div>
             <!-- button  -->
             <div class="d-flex justify-content-end">
                <a href="{{ route('roles.index')}}" class="btn btn-primary mx-1" role="button">
                   {{ trans('roles.button.back.value') }}
                </a>
             </div>
          </div>
       </div>
    </div>
 </div>
 
@endsection
