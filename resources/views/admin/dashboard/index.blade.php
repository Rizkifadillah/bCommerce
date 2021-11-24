@extends('layouts.master')

@section('title')
    Beranda
@endsection

@section('breadcumbs')
    <h6>
        {{ Breadcrumbs::render('dashboard') }}
    </h6>
@endsection


@section('content')
    Blank DashBoard
@endsection