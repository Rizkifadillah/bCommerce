<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $guarded = [];

    //relasi ke user
    public function user(){
        return $this->belongsTo('App\Modles\User');
    }

    public function categories(){
        return $this->belongsToMany('App\Models\Category', 'product_categories');
    }

    public function productImages(){
        return $this->hasMany('App\Models\ProductImage');
    }

    public static function statuses(){
        return [
            0 => 'draft',
            1 => 'active',
            2 => 'inactive',
        ];
    }
}
