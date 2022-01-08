
	<!-- Top bar starts -->
	<div class="top-bar">
		<div class="container">

			<!-- Contact starts -->
			<div class="tb-contact pull-left">
				<!-- Email -->
				<i class="fa fa-envelope color"></i> &nbsp; <a href="mailto:contact@domain.com">rizkifadillah.rf@gmail.com</a>
				&nbsp;&nbsp;
				<!-- Phone -->
				<i class="fa fa-phone color"></i> &nbsp; +62 857-1685-5817
			</div>
			<!-- Contact ends -->

			<!-- Shopping kart starts -->
			<div class="tb-shopping-cart pull-right">
				
				<!-- Link with badge -->
				@auth
				<a href="#" class="btn btn-white btn-xs b-dropdown"><i class="fa fa-key"></i> {{ auth()->user()->name}} <i class="fa fa-angle-down color"></i> <span class="badge badge-color">5</span></a>
				<!-- Dropdown content with item details -->
				<div class="b-dropdown-block">
					<!-- Heading -->
					<h4><i class="fa fa-shopping-cart color"></i> Your Account</h4>
					
					<ul class="list-unstyled">
						<!-- Item 1 -->
						<li>
							<!-- Item image -->
							<div class="cart-img">
								<a href="#"><img src="{{ asset('assets/backend/assets/images/faces/face8.jpg')}}" alt="" class="img-responsive" /></a>
							</div>
							<!-- Item heading and price -->
							<div class="cart-title">
								<h5><a href="#">{{ auth()->user()->name}}</a></h5>
								<!-- Item price -->
								<span class="label label-color label-sm">5 post</span>
							</div>
							<div class="clearfix"></div>
						</li>
						<!-- Item 2 -->
						
					</ul>
					
					<a href="#" class="btn btn-white btn-sm">
						{{ trans('blog.menu.dashboard') }}
					</a> 
					&nbsp; 
					<a href="" class="btn btn-color btn-sm"
					onclick="event.preventDefault();document.getElementById('logout-form').submit();">
						Logout
					</a>
					<form id="logout-form" action="{{ route('logout')}}" method="POST" class="d-none">
						<!-- csrf -->
						@csrf
					</form>
				</div>
				@else
				<a href="{{ route('login')}}" class="btn btn-white btn-xs"><i class="fa fa-key"></i> Login <i class="fa fa-angle-down color"></i> <span class="badge badge-color">2</span></a>

				@endauth
			</div>
			<!-- Shopping kart ends -->

			<!-- Langauge starts -->
			<div class="tb-language dropdown pull-right">
				@switch(app()->getLocale())
					
					@case('id')
						<a href="#" data-target="#" data-toggle="dropdown"><i class="fa fa-globe text-blue"></i> Indonesia <i class="fa fa-angle-down color"></i></a>
						@break
					@case('en')
						<a href="#" data-target="#" data-toggle="dropdown"><i class="fa fa-globe text-blue"></i> English <i class="fa fa-angle-down color"></i></a>
						@break
					@default
						
				@endswitch
				<!-- Dropdown menu with languages -->
				<ul class="dropdown-menu dropdown-mini" role="menu">
					<li><a href="{{ route('localization.switch', ['language' => 'id'])}}"><i class="flag-icon fa fa-globe text-blue flag-icon-id"></i>ID</a></li>
                    <li><a href="{{ route('localization.switch', ['language' => 'en'])}}"><i class="flag-icon fa fa-globe text-blue flag-icon-gb"></i>EN</a></li>
				</ul>

				
			</div>
			
			<!-- Language ends -->

			<!-- Search section for responsive design -->
			<div class="tb-search pull-left">
				<a href="#" class="b-dropdown"><i class="fa fa-search square-2 rounded-1 bg-color white"></i></a>
				<div class="b-dropdown-block">
					<form>
						<!-- Input Group -->
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Type Something">
									<span class="input-group-btn">
										<button class="btn btn-color" type="button">Search</button>
									</span>
						</div>
					</form>
				</div>
			</div>
			<!-- Search section ends -->

			<!-- Social media starts -->
			<div class="tb-social pull-right">
				<div class="brand-bg text-right">
					<!-- Brand Icons -->
					<a href="#" class="facebook"><i class="fa fa-facebook square-2 rounded-1"></i></a>
					<a href="#" class="twitter"><i class="fa fa-twitter square-2 rounded-1"></i></a>
					<a href="#" class="google-plus"><i class="fa fa-github square-2 rounded-1"></i></a>
				</div>
			</div>
			<!-- Social media ends -->

			<div class="clearfix"></div>
		</div>
	</div>
	
	
	<!-- Top bar ends -->