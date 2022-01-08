@extends('layouts.master')

@section('title')
    Products
@endsection

@section('breadcumbs')
    <h6>
        {{ Breadcrumbs::render('products') }}
    </h6>
@endsection


@section('content')

<div class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="card card-default">
                <div class="card-header card-header-border-bottom">
                    <h2>Orders</h2>
                </div>
                <div class="card-body">
                    @include('admin.partials.flash')
                    @include('admin.orders.filter')
                    <table class="table table-bordered table-striped">
                        <thead>
                            <th>Order ID</th>
                            <th>Grand Total</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Payment</th>
                            <th>Action</th>
                        </thead>
                        <tbody>
                            @forelse ($orders as $order)
                                <tr>    
                                    <td>
                                        {{ $order->code }}<br>
                                        <span style="font-size: 12px; font-weight: normal"> {{\General::datetimeFormat($order->order_date) }}</span>
                                    </td>
                                    <td>{{\General::priceFormat($order->grand_total) }}</td>
                                    <td>
                                        {{ $order->customer_full_name }}<br>
                                        <span style="font-size: 12px; font-weight: normal"> {{ $order->customer_email }}</span>
                                    </td>
                                    <td>{{ $order->status }}</td>
                                    <td>{{ $order->payment_status }}</td>
                                    <td>
                                        @can('edit_orders')
                                            <a href="{{ url('admin/orders/'. $order->id) }}" class="btn btn-info btn-sm">show</a>
                                        @endcan
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5">No records found</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                    @if ($orders->hasPages())
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                {{ $orders->links('pagination::bootstrap-4') }}
                            </ul>
                        </div>
                    @endif
                    {{-- {{ $orders->links() }} --}}
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@push('javascript-internal')
<script>
    $(document).ready(function(){
        //event : delete Product
        $("form[role='alert']").submit(function (event) {
            event.preventDefault();
            Swal.fire({
                title: $(this).attr('alert-title'),
                text: $(this).attr('alert-message'),
                icon: 'warning',
                allowOutsideClick: false,
                showCancelButton: true,
                cancelButtonText: $(this).attr('alert-btn-cancel'),
                reverseButtons: true,
                confirmButtonText: $(this).attr('alert-btn-ok'),
                }).then((result) => {
                if (result.isConfirmed) {
                    // todo: process of deleting categories
                    event.target.submit();
                }
            });
        });
    })
</script>
    
@endpush