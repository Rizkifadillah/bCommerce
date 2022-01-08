@extends('layouts.master')

@section('title')
{{ trans('roles.title.create')}}
@endsection

@section('breadcumbs')
  {{ Breadcrumbs::render('add_roles') }}

@endsection
@section('content')
 <div class="row">
    <div class="col-md-12">
       <div class="card">
          <form action="{{ route('roles.store')}}" method="POST">
            @csrf
             <div class="card-body">
                <div class="form-group">
                   <label for="input_role_name" class="font-weight-bold">
                      {{ trans('roles.form_control.input.name.label') }}
                   </label>
                   <input id="input_role_name" value="{{ old('name')}}" name="name" type="text" class="form-control @error('name') is-invalid @enderror "  />
                   @error('name')
                   <span class="invalid-feedback" role="alert">
                      <small>{{ $message }}</small>
                      <br>
                   </span>
                   @enderror
                </div>
                <!-- permission -->
                <div class="form-group">
                    <label for="input_role_permission" class="font-weight-bold">
                        {{ trans('roles.form_control.input.permission.label') }}
                    </label>
                   <div class="form-control overflow-auto h-50 @error('permissions') is-invalid @enderror " id="input_role_permission">
                      <div class="row">
                         <!-- list manage name:start -->
                         @foreach ($authorities as $manageName => $permissions)
                         <ul class="list-group mx-1">
                            <li class="list-group-item bg-dark text-white">
                               {{ trans("permissions.{$manageName}") }}
                            </li>
                            <!-- list permission:start -->
                            @foreach ($permissions as $permission)
                            
                            <li class="list-group-item h-10">
                                <div class="form-group">
                                    <div class="form-check form-check-flat">
                                        <label for="{{ $permission}}" class="form-check-label">
                                            @if (old('permissions'))
                                                <input id="{{ $permission }}" name="permissions[]" type="checkbox" value="{{ $permission }}" {{ in_array($permission,old('permissions')) ? "checked" : null }} class="form-check-input " name="category[]"> 
                                            @else
                                                <input id="{{ $permission }}" name="permissions[]" type="checkbox" value="{{ $permission }}" class="form-check-input " name="category[]"> 
                                            @endif
                                            {{-- <input id="{{ $permission }}" name="permissions[]" type="checkbox" value="{{ $permission }}" {{ in_array($permission,old('permissions')) ? "checked" : null }} class="form-check-input " name="category[]">  --}}
                                            {{ trans("permissions.{$permission}") }}
                                            <i class="input-helper"></i>
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
                             
                         @endforeach
                         <!-- list manage name:end  -->
                      </div>
                   </div>
                   @error('permission')
                        <span class="invalid-feedback" role="alert">
                            <small>{{ $message }}</small>
                            <br>
                        </span>
                    @enderror
                </div>
                <div class="float-right mb-4">
                   <a class="btn btn-warning px-4 mx-2" href="">
                      {{ trans('roles.button.back.value') }}
                   </a>
                   <button type="submit" class="btn btn-primary px-4">
                    {{ trans('roles.button.save.value') }}
                </button>
                </div>
             </div>
          </form>
       </div>
    </div>
 </div>
@endsection
