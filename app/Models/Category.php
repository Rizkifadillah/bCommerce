<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    // protected $guarded = [];
    protected $fillable = ['name', 'slug', 'parent_id'];

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

    public function scopeParentCategories($query)
    {
        return $query->where('parent_id', 0);
    }

    public function childIds($parentId = 0 )
    {
        $categories = Category::select('id','name','parent_id')->where('parent_id', $parentId)->get()->toArray();

        $childIds = [];
        if (!empty($categories)) {
            # code...
            foreach($categories as $category){
                $childIds[] = $category['id'];
                $childIds = \array_merge($childIds, Category::childIds($category['id']));
            }
        }

        return $childIds;
    }
}
