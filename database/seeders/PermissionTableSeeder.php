<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Models\User;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $authorities = config('permission.authorities');

        $listPermission = [];
        $superAdminPermissions = [];
        $adminPermissions = [];
        $editorPermissions = [];

        foreach ($authorities as $label => $permissions) {
            # code...
            foreach ($permissions as $permission) {
                # code...
                $listPermission[] = [
                    'name' => $permission,
                    'guard_name' =>'web',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                ];
                //Superadmin
                $superAdminPermissions[] = $permission;
                //Admin
                if (in_array($label, ['manage_products', 'manage_orders', 'manage_categories', 'manage_attributes'])) {
                    # code...
                    $adminPermissions[] = $permission;
                }
                //Editor
                if (in_array($label, ['manage_products'])) {
                    # code...
                    $editorPermissions[] = $permission;
                }
            }
            
        }

        //insert permission

        Permission::insert($listPermission);

        //inser roles
        //superadmin
        $superAdmin = Role::create([
            'name' => "SuperAdmin",
            'guard_name' =>'web',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        //admin
        $admin = Role::create([
            'name' => "Admin",
            'guard_name' =>'web',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        //editor
        $editor = Role::create([
            'name' => "Client",
            'guard_name' =>'web',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        //menghubungkan akses role dan permission
        $superAdmin->givePermissionTo($superAdminPermissions);
        $admin->givePermissionTo($adminPermissions);
        $editor->givePermissionTo($editorPermissions);

        //
        $userSuperAdmin = User::find(1)->assignRole("Superadmin");
    
    }
}
