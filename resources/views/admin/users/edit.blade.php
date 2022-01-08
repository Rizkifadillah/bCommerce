@extends('layouts.master')

@section('title')
{{ trans('users.title.edit')}}
@endsection

@section('breadcumbs')
  {{-- {{ Breadcrumbs::render('edit_users_title', $user) }} --}}

@endsection
@section('content')
 <div class="row"> 
    <div class="col-md-12">
       <div class="card">
          <div class="card-body">
             <form action="{{ route('users.update',['user' => $user])}}" method="POST">
               @csrf
               @method('put')
                <!-- name -->
                <div class="form-group">
                   <label for="input_user_name" class="font-weight-bold">
                      {{ trans('users.form_control.input.name.label') }}
                   </label>
                   <input id="input_user_name" value="{{ old('name',$user->name)}}" name="name" type="text" class="form-control @error('name') is-invalid @enderror" placeholder="{{ trans('users.form_control.input.name.placeholder') }}" readonly/>
                   <!-- error message -->
                    @error('name')
                        <span class="invalid-feedback" role="alert">
                           <small>{{ $message }}</small>
                           <br>
                        </span>
                     @enderror
                </div>
                <!-- role -->
                <div class="form-group">
                   <label for="select_user_role" class="font-weight-bold">
                    {{ trans('users.form_control.select.role.label') }}
                   </label>
                   <select id="select_user_role" name="role" data-placeholder="{{ trans('users.form_control.select.role.placeholder') }}" class="custom-select w-100 @error('role') is-invalid @enderror" >
                     @if (old('role', $roleSelected))
                     <option value="{{ old('role', $roleSelected)->id}}" selected="selected">
                        {{ old('role', $roleSelected)->name}}
                     </option>
                          
                      @endif
                   </select>
                   <!-- error message -->
                    @error('role')
                        <span class="invalid-feedback" role="alert">
                           <small>{{ $message }}</small>
                           <br>
                        </span>
                     @enderror
                </div>
                <!-- email -->
                <div class="form-group">
                   <label for="input_user_email" class="font-weight-bold">
                    {{ trans('users.form_control.input.email.label') }}
                   </label>
                   <input id="input_user_email" value="{{ old('email',$user->email)}}" name="email" type="email" class="form-control @error('email') is-invalid @enderror" placeholder="{{ trans('users.form_control.input.email.placeholder') }}"
                      autocomplete="email" readonly/>
                   <!-- error message -->
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                           <small>{{ $message }}</small>
                           <br>
                        </span>
                     @enderror
                </div>
               
                <div class="float-right">
                   <a class="btn btn-warning px-4 mx-2" href="{{ route('users.index')}}">
                      {{ trans('users.button.back.value') }}
                   </a>
                   <button type="submit" class="btn btn-primary float-right px-4">
                    {{ trans('users.button.edit.value') }}
                   </button>
                </div>
             </form>
          </div>
       </div>
    </div>
 </div>
@endsection

@push('css-external')
    <link rel="stylesheet" href="{{ asset('select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('select2/css/select2-bootstrap4.min.css')}}">
@endpush


@push('javascript-external')
    <script src="{{ asset('select2/js/select2.min.js')}}"></script>
    <script src="{{ asset('select2/js/i18n/' .app()->getLocale(). '.js')}}"></script>
@endpush



@push('javascript-internal')
<script>
    $(document).ready(function () {

         //event::select2 tags
         //select2 tag
         $('#select_user_role').select2({
            theme: 'bootstrap4',
            language: "{{ app()->getLocale() }}",
            allowClear: true,
            ajax: {
               url: "{{ route('roles.select')}}",
               dataType: 'json',
               delay: 250,
               processResults: function(data) {
                  return {
                     results: $.map(data, function(item) {
                        return {
                           text: item.name,
                           id: item.id
                        }
                     })
                  };
               }
            }
         });


    })

</script>
    
@endpush
