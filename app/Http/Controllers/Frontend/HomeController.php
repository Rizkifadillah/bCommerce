<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slide;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $products = Product::popular()->get();
        $this->data['products'] = $products;

        $slides = Slide::active()->orderBy('position', 'ASC')->get();
		$this->data['slides'] = $slides;

        return view('themes.ezone.home', $this->data);
    }
}
