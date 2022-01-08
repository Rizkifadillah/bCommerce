<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveColumnAttributeProductValueIdInProductInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_inventories', function (Blueprint $table) {
            // $table->dropForeign('attribute_product_value_id');
            // $table->dropColumn('attribute_product_value_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_inventories', function (Blueprint $table) {
            // $table->unsignedBigInteger('attribute_product_value_id');
            // $table->foreign('attribute_product_value_id')->references('id')->on('attribute_product_values')->onDelete('cascade');
        });
    }
}
