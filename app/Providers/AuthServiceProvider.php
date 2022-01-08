<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('manage_products',function($user){
            return $user->hasAnyPermission([
                'view_products',
                'add_products',
                'edit_products',
                'delete_products',
            ]);
        });

        Gate::define('manage_categories',function($user){
            return $user->hasAnyPermission([
                'view_categories',
                'add_categories',
                'edit_categories',
                'delete_categories',
            ]);
        });

        Gate::define('manage_attributes',function($user){
            return $user->hasAnyPermission([
                'view_attributes',
                'add_attributes',
                'edit_attributes',
                'delete_attributes',
            ]);
        });

        Gate::define('manage_roles',function($user){
            return $user->hasAnyPermission([
                'view_roles',
                'add_roles',
                'edit_roles',
                'delete_roles',
            ]);
        });

        Gate::define('manage_users',function($user){
            return $user->hasAnyPermission([
                'view_users',
                'add_users',
                'edit_users',
                'delete_users',
            ]);
        });

        Gate::define('manage_orders',function($user){
            return $user->hasAnyPermission([
                'view_orders',
                'add_orders',
                'edit_orders',
                'delete_orders',
            ]);
        });
    }
}
