<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddParentProductIdToAttributeProductValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('attribute_product_values', function (Blueprint $table) {
            $table->unsignedBigInteger('parent_product_id')->after('id')->nullable();

            $table->foreign('parent_product_id')->references('id')->on('products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('attribute_product_values', function (Blueprint $table) {
            $table->dropForeign('attribute_product_values_parent_product_id_foreign');
            $table->dropForeign('parent_product_id');
        });
    }
}
