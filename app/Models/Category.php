<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $guarded = [];

    //1 kategori mempunyai bnyak anak kategori
    public function childs(){
        return $this->hasMany('App\Models\Category', 'parent_id');
    }

    // kategori mempunyai 1 kategori
    public function parent(){
        return $this->belongsTo('App\Models\Category', 'parent_id');
    }

    // relasi keproducts
    public function products(){
        return $this->belongsToMany('App\Models\Product', 'categories_product');
    }
}
