<?php

use Illuminate\Support\Facades\Route;

if ( !function_exists('set_active')) {
    # code...
    function set_active($uri,$output = 'active')
    {
        if (is_array($uri)) {
            # code...
            foreach ($uri as $u) {
                if (Route::is($u)) {
                    # code...
                    return $output;
                }
            }
        } else {
            # code...
            if (Route::is($uri)) {
                # code...
                return $output;
            }
        }
        
    }
}

