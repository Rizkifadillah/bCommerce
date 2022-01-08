<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item dropdown show">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" class="nav-link dropdown-toggle">
          @switch(app()->getLocale())
                @case("id")
                {{ strtoupper(app()->getLocale()) }}

                  @break
                @case("en")
                {{ strtoupper(app()->getLocale()) }}                  @break
              @default
            @endswitch
        </a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
          <li>
            <a href="{{ route('localization.switch', ['language' => 'en'])}}" class="dropdown-item">
              {{ trans('localization.en') }}
            </a>
          </li>
          <li>
            <a href="{{ route('localization.switch', ['language' => 'id'])}}" class="dropdown-item">
              {{ trans('localization.id') }}
            </a>
          </li>
          <li><a href="#" class="dropdown-item">Some other action</a></li>

         
          <!-- End Level two -->
        </ul>
      </li>
     
    </ul>

    <!-- SEARCH FORM -->
    

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>