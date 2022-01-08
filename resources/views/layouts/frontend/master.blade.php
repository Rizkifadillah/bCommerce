
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
	<title>Home page | LookCare</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Fav icon -->
	<link rel="shortcut icon" href="{{ asset('assets/frontend/img/favicon.ico')}}">

	<!-- Font -->
	<link href='https://fonts.googleapis.com/css?family=Lato:400,400italic,900,700,700italic,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Cantata+One' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700,600' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300,500,700' rel='stylesheet' type='text/css'>
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="{{ asset('assets/frontend/css/bootstrap.min.css')}}">

	<!-- Magnific Popup -->
	<link href="{{ asset('assets/frontend/css/magnific-popup.css')}}" rel="stylesheet">

	<link rel="stylesheet" href="{{ asset('assets/frontend/css/font-awesome.min.css')}}">
	<link rel="stylesheet" href="{{ asset('assets/frontend/css/normalize.css')}}">
	<link rel="stylesheet" href="{{ asset('assets/frontend/css/skin-lblue.css')}}">

	<link rel="stylesheet" href="{{ asset('assets/frontend/css/ecommerce.css')}}">

	<link rel="stylesheet" href="{{ asset('assets/frontend/layerslider/css/layerslider.css')}}" type="text/css"><!-- Layer Slider -->

	<!-- Owl carousel -->
	<link href="{{ asset('assets/frontend/css/owl.carousel.css')}}" rel="stylesheet">

	<link rel="stylesheet" href="{{ asset('assets/frontend/css/main.css')}}">
	<link rel="stylesheet" href="{{ asset('assets/frontend/style.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/frontend/css/revolutionslider_settings.css')}}" media="screen" />
	<link rel="stylesheet" href="{{ asset('assets/frontend/css/responsive.css')}}">
	<script src="{{ asset('assets/frontend/js/vendor/modernizr-2.6.2.min.js')}}"></script>
</head>

<body class="style-14 index-3">
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->


<!-- Start Loading -->
	@include('layouts.frontend.loading')

<!-- End Loading  -->

<!-- start header -->
<header>
	<!-- Top bar starts -->
	@include('layouts.frontend.topbar')
		

	<!-- Top bar ends -->

	<!-- Header One Starts -->
	@include('layouts.frontend.header')

	<!-- Header one ends -->

</header>
<!-- end header -->

<!-- start main content -->
<main class="main-container">

	<!-- new collection directory -->
	{{-- @include('layouts.frontend.collection_top') --}}
	

	{{-- @include('layouts.frontend.collection_bottom') --}}

	<!-- end new collection directory -->





	<!-- Shop Filter
    ============================================= -->
	{{-- @include('layouts.frontend.shop_filter') --}}

	


	<!-- Start Our Shop Items -->

	<!-- recommend  items Starts -->
	{{-- @include('layouts.frontend.recommend_item') --}}
	{{-- @include('layouts.frontend.items_slider') --}}

	@yield('content')

	<!-- recommend items Ends -->

	<!-- End Our Shop Items -->


	@include('layouts.frontend.parallax')


	<!-- Start Our Clients -->
	@include('layouts.frontend.client')


	<!-- End Our Clients  -->

	{{-- main_footer --}}
	@include('layouts.frontend.main_footer')

	

</main>
<!-- end main content -->






<!-- start footer area -->
@include('layouts.frontend.footer')

<!-- footer area end -->


<!-- All script -->
<script src="{{ asset('assets/frontend/js/vendor/jquery-1.10.2.min.js')}}"></script>
<script src="{{ asset('assets/frontend/js/bootstrap.min.js')}}"></script>
<script src="{{ asset('assets/frontend/js/smoothscroll.js')}}"></script>
<!-- Scroll up js
============================================ -->
<script src="{{ asset('assets/frontend/js/jquery.scrollUp.js')}}"></script>
<script src="{{ asset('assets/frontend/js/menu.js')}}"></script>


<script src="{{ asset('assets/frontend/js/pluginse209.js?v=1.0.0')}}"></script>

<!-- Magnific Popup -->
<script src="{{ asset('assets/frontend/js/jquery.magnific-popup.min.js')}}"></script>

<script src="{{ asset('assets/frontend/js/jquery.countdown.min.js')}}"></script>


<script src="{{ asset('assets/frontend/js/jquery.scrolly.js')}}"></script>


<!-- External libraries: jQuery & GreenSock -->
<script src="{{ asset('assets/frontend/layerslider/js/greensock.js')}}" type="text/javascript"></script>
<!-- LayerSlider script files -->
<script src="{{ asset('assets/frontend/layerslider/js/layerslider.transitions.js')}}" type="text/javascript"></script>
<script src="{{ asset('assets/frontend/layerslider/js/layerslider.kreaturamedia.jquery.js')}}" type="text/javascript"></script>


<!-- Owl carousel -->
<script src="{{ asset('assets/frontend/js/owl.carousel.min.js')}}"></script>
<script src="{{ asset('assets/frontend/js/main.js')}}"></script>



<script type="text/javascript">
	$(document).ready(function() {

		"use strict";

		//** Slider  **//
		jQuery("#layerslider").layerSlider({
			responsive: true,
			responsiveUnder: 1170,
			layersContainer: 1170,
			skin: 'v5',
			hoverPrevNext: true,
			navPrevNext: true,
			navStartStop: false,
			navButtons: false,
			skinsPath: 'layerslider/skins/'
		});


		/*=================== Parallax ===================*/
		$('.parallax').scrolly({bgParallax: true});


		/* Owl carousel */
		$(".owl-carousel").owlCarousel({
			slideSpeed : 500,
			rewindSpeed : 1000,
			mouseDrag : true,
			stopOnHover : true
		});
		/* Own navigation */
		$(".owl-nav-prev").click(function(){
			$(this).parent().next(".owl-carousel").trigger('owl.prev');
		});
		$(".owl-nav-next").click(function(){
			$(this).parent().next(".owl-carousel").trigger('owl.next');
		});


	});
</script>


</body>


</html>