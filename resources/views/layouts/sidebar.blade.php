
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ url('/')}}" class="brand-link">
      <img src="{{ asset('assets/dist/img/boxed-bg.png')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SISadmin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset( Auth::user()->foto ?? 'assets/dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image" style="height: 30px;  width:30px;">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{ Auth::user()->first_name ?? ''}}</a>
        </div>

        {{-- @php
            $user = \App\Models\User::where('id', Auth::user()->id)->first();
            $role = $user->roles->first()->name;

            
        @endphp
        <div class="info">
          <a href="#" class="d-block">{{$role ?? ''}}</a>
        </div> --}}
      </div>

      <!-- SidebarSearch Form -->
      

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
              <li class="nav-item">
                <a href="{{ route('dashboard.index')}}" class="nav-link {{ set_active(['dashboard.index','dashboard.create','dashboard.edit','dashboard.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li>

              <li class="nav-header">MASTER DATA</li>
              @can('manage_categories')
                
                <li class="nav-item">
                  <a href="{{ route('categories.index')}}" class="nav-link {{ set_active(['categories.index','categories.create','categories.edit','categories.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Categories</p>
                  </a>
                </li>
              @endcan

              
              @can('manage_products')
              <li class="nav-item">
                <a href="{{ route('products.index')}}" class="nav-link {{ set_active(['products.index','products.create','products.edit','products.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li>
              @endcan

              @can('manage_attributes')
                <li class="nav-item">
                  <a href="{{ route('attributes.index')}}" class="nav-link {{ set_active([
                    'attributes.index','attributes.create','attributes.edit','attributes.show',
                    'attributes.option', 'attributes.addoption', 'attributes.editoption'
                    ]) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Attributes</p>
                  </a>
                </li>
              @endcan

              <li class="nav-header">ORDERS</li>
              @can('manage_categories')
                
                <li class="nav-item">
                  <a href="{{ route('orders.index')}}" class="nav-link {{ set_active(['orders.index','orders.create','orders.edit','orders.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Orders</p>
                  </a>
                </li>
              @endcan

              
              @can('manage_products')
              <li class="nav-item">
                <a href="{{ route('orders.trashed')}}" class="nav-link {{ set_active(['orders.trashed']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Trashed</p>
                </a>
              </li>
              @endcan

              @can('manage_attributes')
                <li class="nav-item">
                  <a href="{{ route('shipments.index')}}" class="nav-link {{ set_active([
                    'shipments.index','shipments.create','shipments.edit','shipments.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Shipments</p>
                  </a>
                </li>
              @endcan

              @can('manage_roles')
              <li class="nav-header">REPORTS</li>
                <li class="nav-item">
                  <a href="{{ url('admin/reports/revenue')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Revenue</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="{{ url('admin/reports/product')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Products</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="{{ url('admin/reports/inventory')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Inventories</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="{{ url('admin/reports/payment')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Payments</p>
                  </a>
                </li>
              @endcan

              <li class="nav-header">GENERAL</li>
              @can('manage_roles')
                <li class="nav-item">
                  <a href="{{ url('admin/slides')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Slides</p>
                  </a>
                </li>
              @endcan

              
              <li class="nav-header">ROLE & USER</li>
              @can('manage_roles')
                <li class="nav-item">
                  <a href="{{ route('roles.index')}}" class="nav-link {{ set_active(['roles.index','roles.create','roles.edit','roles.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Roles</p>
                  </a>
                </li>
              @endcan
              
              @can('manage_users')
                <li class="nav-item">
                  <a href="{{ route('users.index')}}" class="nav-link {{ set_active(['users.index','users.create','users.edit','users.show']) }}">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Users</p>
                  </a>
                </li>
              @endcan

{{-- 
              <li class="nav-item">
                <a href="{{ route('staff.index')}}" class="nav-link {{ set_active(['staff.index','staff.create','staff.edit','staff.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Staff</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('mapel.index')}}" class="nav-link {{ set_active(['mapel.index','mapel.create','mapel.edit','mapel.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Mapel</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('guru.index')}}" class="nav-link {{ set_active(['guru.index','guru.create','guru.edit','guru.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Guru</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('kelas.index')}}" class="nav-link {{ set_active(['kelas.index','kelas.create','kelas.edit','kelas.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('siswa.index')}}" class="nav-link {{ set_active(['siswa.index','siswa.create','siswa.edit','siswa.show']) }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Siswa</p>
                </a>
              </li> --}}
             
  
            {{-- </ul> --}}
          {{-- </li> --}}
         
          <li class="nav-header">MISCELLANEOUS</li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('logout') }}"
                onclick="event.preventDefault();
                              document.getElementById('logout-form').submit();">
                {{ __('Logout') }}
            </a>

            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>