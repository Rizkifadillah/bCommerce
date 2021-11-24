<div class="card card-default">
    <div class="card-header">
        <h3 class="card-title">Product Menu</h3>
    </div>
    <div class="card-body">
        <nav class="nav flex-column">
            @if (empty($productID))
                <a href="#" class="nav-link">Product Datail</a>
                <a href="#" class="nav-link">Product Image</a>
            @else
                <a href="{{ route('products.edit', $productID)}}" class="nav-link">Product Datail</a>
                <a href="{{ route('products.images', $productID)}}" class="nav-link">Product Image</a>
            @endif
        </nav>
    </div>
</div>