
<?php // routes/breadcrumbs.php

// Note: Laravel will automatically resolve `Breadcrumbs::` without
// this import. This is nice for IDE syntax and refactoring.
use Diglactic\Breadcrumbs\Breadcrumbs;

// This import is also not required, and you could replace `BreadcrumbTrail $trail`
//  with `$trail`. This is nice for IDE type checking and completion.
use Diglactic\Breadcrumbs\Generator as BreadcrumbTrail;

// Beranda
Breadcrumbs::for('dashboard', function ($trail) {
    $trail->push('Dashboard', route('dashboard.index'));
});


// Categories
Breadcrumbs::for('categories', function ( $trail) {
    $trail->push('Categories', route('categories.index'));
});


// Categories > add_category
Breadcrumbs::for('add_category', function ( $trail) {
    $trail->parent('categories');
    $trail->push('Tambah Category', route('categories.create'));
});


// Categories > edit_category
Breadcrumbs::for('edit_category', function ( $trail,$category) {
    $trail->parent('categories');
    $trail->push('Edit Category', route('categories.edit',['category' => $category]));
});



// Categories > edit_category > [title]
Breadcrumbs::for('edit_category_name', function ( $trail, $category) {
    $trail->parent('edit_category', $category);
    $trail->push( ucwords($category->name), route('categories.edit',['category' => $category]));
});


// Categories
Breadcrumbs::for('products', function ( $trail) {
    $trail->push('Products', route('products.index'));
});


// Categories > add_category
Breadcrumbs::for('add_product', function ( $trail) {
    $trail->parent('products');
    $trail->push('Tambah Products', route('products.create'));
});


// Categories > edit_category
Breadcrumbs::for('edit_product', function ( $trail,$product) {
    $trail->parent('categories');
    $trail->push('Edit Product', route('products.edit',['product' => $product]));
});



// Categories > edit_category > [title]
Breadcrumbs::for('edit_product_name', function ( $trail, $product) {
    $trail->parent('edit_product', $product);
    $trail->push( ucwords($product->name), route('products.edit',['product' => $product]));
});

// Categories
Breadcrumbs::for('mapel', function ( $trail) {
    $trail->push('Mapel', route('mapel.index'));
});

// mapel > add
Breadcrumbs::for('edit_mapel', function ( $trail,$mapel) {
    $trail->parent('mapel');
    $trail->push('Edit Mapel', route('mapel.edit',['mapel' => $mapel]));
});

// tags > edit > [title]
Breadcrumbs::for('edit_mapel_name', function ( $trail, $mapel) {
    $trail->parent('edit_mapel', $mapel);
    $trail->push( ucwords($mapel->nama), route('mapel.edit',['mapel' => $mapel]));
});

// Categories
Breadcrumbs::for('guru', function ( $trail) {
    $trail->push('Guru', route('guru.index'));
});

// staff > add
Breadcrumbs::for('add_guru', function ( $trail) {
    $trail->parent('guru');
    $trail->push('Tambah guru', route('guru.create'));
});



// roles
Breadcrumbs::for('roles', function ( $trail) {
    $trail->push('Roles', route('roles.index'));
});


// categories > detail
Breadcrumbs::for('detail_roles', function ( $trail, $role) {
    $trail->parent('roles');
    $trail->push('Detail', route('roles.show', ['role' => $role]));
});


// categories > detail > [title]
Breadcrumbs::for('detail_roles_title', function ( $trail, $role) {
    $trail->parent('detail_roles', $role);
    $trail->push( $role->name, route('roles.show', ['role' => $role]));
});


// posts > add
Breadcrumbs::for('add_roles', function ( $trail) {
    $trail->parent('roles');
    $trail->push('Add', route('roles.create'));
});


// categories > detail
Breadcrumbs::for('edit_roles', function ( $trail, $role) {
    $trail->parent('roles');
    $trail->push('Edit', route('roles.edit', ['role' => $role]));
});


// categories > edit > [title]
Breadcrumbs::for('edit_roles_title', function ( $trail, $role) {
    $trail->parent('edit_roles', $role);
    $trail->push( $role->name, route('roles.edit', ['role' => $role]));
});




// users
Breadcrumbs::for('users', function ( $trail) {
    $trail->push('Users', route('users.index'));
});


// posts > add
Breadcrumbs::for('add_users', function ( $trail) {
    $trail->parent('users');
    $trail->push('Add', route('users.create'));
});


// categories > edit
Breadcrumbs::for('edit_users', function ( $trail, $user) {
    $trail->parent('users');
    $trail->push('Edit', route('users.edit', ['user' => $user]));
});


// categories > edit > [title]
Breadcrumbs::for('edit_users_title', function ( $trail, $user) {
    $trail->parent('edit_users', $user);
    $trail->push( $user->name, route('users.edit', ['user' => $user]));
});
