@extends('layouts.frontend.master')


@push('css-internal')
<style>
    .container {
        padding: 10px;
    }
    
    .full-width-image {
        margin: -10px;
    }

    .img-responsive {
        display: block;
        height: auto;
        max-width: 100%;

    }

    .container-fluid {
        overflow-x: hidden;
    }
</style>    
@endpush

@section('title')
    Shop
@endsection

@section('content')
    Home Test
    <!-- new collection directory -->
	@include('layouts.frontend.collection_top')
	

	@include('layouts.frontend.collection_bottom')

	<!-- end new collection directory -->





	<!-- Shop Filter
    ============================================= -->
	@include('layouts.frontend.shop_filter')

	


	<!-- Start Our Shop Items -->

	<!-- recommend  items Starts -->
	{{-- @include('layouts.frontend.recommend_item') --}}
	@include('layouts.frontend.items_slider')

@endsection