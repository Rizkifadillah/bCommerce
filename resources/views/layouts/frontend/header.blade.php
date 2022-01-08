
	<!-- Header One Starts -->
	<div class="header-1">

		<!-- Container -->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<!-- Logo section -->
					<div class="logo">
						<h1><a href="#"><i class="fa fa-bookmark-o"></i> BlogShare</a></h1>
					</div>
				</div>
				<div class="col-md-6 col-md-offset-2 col-sm-5 col-sm-offset-3 hidden-xs">
					<!-- Search Form -->
					<div class="header-search">
						<form action="" method="GET">
							<!-- Input Group -->
								<!-- <div class="widget">
									{{-- <form action="{{ route('blog.search') }}" method="GET"> --}}
										<div Type="submit" class="search-icon"><input name="keyword" value="{{ request()->get('keyword') }}" type="text" class="searching" placeholder="Type and press enter" /></div>
									</form>
								</div> -->
							<div class="input-group">
								{{-- <!-- <form action="{{ route('blog.search') }}" method="GET"> --> --}}
									<input name="keyword" value="{{ request()->get('keyword') }}" type="text" class="form-control" placeholder="Search Post">
									<span class="input-group-btn">
										<button class="btn btn-color" Type="submit">Search</button>
									</span>
								<!-- </form> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Navigation starts -->

		<div class="navi">
			<div class="container">
				<div class="navy">
					<ul>
						<!-- Main menu -->
						<li>
							<a href="#">Home</a>
						</li>

						<li><a href="{{ route('product.home')}}">Product</a>
							
						</li>

						<li><a href="#">Category</a>
							
						</li>

						<li><a href="#">Tags</a>
							
						</li>


						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Navigation ends -->

	</div>

	<!-- Header one ends -->