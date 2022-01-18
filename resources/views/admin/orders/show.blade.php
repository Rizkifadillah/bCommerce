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
<div class="container-fluid">
    <div class="card">

        <div class="invoice p-3 mb-3">
            <!-- title row -->
            <div class="row">
              <div class="col-12">
                <h4>
                  <i class="fas fa-globe"></i> Order ID #{{ $order->code }}
                  <small class="float-right">
                    <div class="btn-group">
                        <button class="btn btn-sm btn-secondary">
                            <i class="mdi mdi-content-save"></i> Save</button>
                        <button class="btn btn-sm btn-secondary">
                            <i class="mdi mdi-printer"></i> Print</button>
                    </div>
                  </small>
                </h4>
              </div>
              <!-- /.col -->
            </div>
            <!-- info row -->
            <div class="row invoice-info">
              <div class="col-sm-4 invoice-col">
                  <strong><u>Billing Address</u></strong>
                <address>
                    {{ $order->customer_first_name }} {{ $order->customer_last_name }}
                    <br> {{ $order->customer_address1 }}
                    <br> {{ $order->customer_address2 }}
                    <br> Email: {{ $order->customer_email }}
                    <br> Phone: {{ $order->customer_phone }}
                    <br> Postcode: {{ $order->customer_postcode }}
                </address>
              </div>
              <!-- /.col -->
              <div class="col-sm-4 invoice-col">
                <strong><u>Shipment Address</u></strong>
                <address>
                    {{ $order->shipment->first_name  ?? '' }} {{ $order->shipment->last_name ?? ''}}
                    <br> {{ $order->shipment->address1 ?? ''}}
                    <br> {{ $order->shipment->address2 ?? ''}}
                    <br> Email: {{ $order->shipment->email ?? ''}}
                    <br> Phone: {{ $order->shipment->phone }}
                    <br> Postcode: {{ $order->shipment->postcode }}
                </address>
              </div>
              <!-- /.col -->
              <div class="col-sm-4 invoice-col">
                   <strong><u>ID</u></strong>: <span class="text-dark">#{{ $order->code }}</span>
                    <br> {{ \General::datetimeFormat($order->order_date) }}
                    <br> Status: {{ $order->status }} {{ $order->isCancelled() ? '('. \General::datetimeFormat($order->cancelled_at) .')' : null}}
                    @if ($order->isCancelled())
                        <br> Cancellation Note : {{ $order->cancellation_note}}
                    @endif
                    <br> Payment Status: {{ $order->payment_status }}
                    <br> Shipped by: {{ $order->shipping_service_name }}
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- Table row -->
            <div class="row">
              <div class="col-12 table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Item</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Unit Cost</th>
                        <th>Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse ($order->orderItems as $item)
                    <tr>
                        <td>{{ $item->sku }}</td>
                        <td>{{ $item->name }}</td>
                        <td>{!! \General::showAttributes($item->attributes) !!}</td>
                        <td>{{ $item->qty }}</td>
                        <td>{{ \General::priceFormat($item->base_price) }}</td>
                        <td>{{ \General::priceFormat($item->sub_total) }}</td>
                    </tr>
                    @empty
                        <tr>
                            <td colspan="6">Order item not found!</td>
                        </tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->

            <div class="row">
              <!-- accepted payments column -->
              <div class="col-6">
                <p class="lead">Payment Methods:</p>
                <img src="{{ asset('assets/dist/img/credit/visa.png')}}" alt="Visa">
                <img src="{{ asset('assets/dist/img/credit/mastercard.png')}}" alt="Mastercard">
                <img src="{{ asset('assets/dist/img/credit/american-express.png')}}" alt="American Express">
                <img src="{{ asset('assets/dist/img/credit/paypal2.png')}}" alt="Paypal">

                <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                  Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem
                  plugg
                  dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                </p>
              </div>
              <!-- /.col -->
              <div class="col-6">
                <p class="lead">Amount Due 2/22/2014</p>

                <div class="table-responsive">
                  <table class="table">
                    <tbody><tr>
                      <th style="width:50%">Subtotal:</th>
                      <td>
                        <span class="d-inline-block float-right text-default">{{ \General::priceFormat($order->base_total_price) }}</span>
                      </td>
                    </tr>
                    <tr>
                      <th>Tax (10%)</th>
                      <td>
                        <span class="d-inline-block float-right text-default">{{ \General::priceFormat($order->tax_amount) }}</span>
                      </td>
                    </tr>
                    <tr>
                      <th>Shipping:</th>
                      <td>
                        <span class="d-inline-block float-right text-default">{{ \General::priceFormat($order->shipping_cost) }}</span>
                      </td>
                    </tr>
                    <tr>
                      <th>Total:</th>
                      <td>
                        <span class="d-inline-block float-right">{{ \General::priceFormat($order->grand_total) }}</span>
                      </td>
                    </tr>
                  </tbody></table>
                  @if (!$order->trashed())
                            @if ($order->isPaid() && $order->isConfirmed())
                                <a href="{{ url('admin/shipments/'. $order->shipment->id .'/edit')}}" class="btn btn-block  btn-primary btn-pill"> Procced to Shipment</a>
                            @endif
                            {{-- @dd(\App\Models\Order::CREATED, \App\Models\Order::CONFIRMED) --}}
        
                            @if (in_array($order->status, [\App\Models\Order::CREATED, \App\Models\Order::CONFIRMED]))
                                <a href="{{ url('admin/orders/'. $order->id .'/cancel')}}" class="btn btn-block  btn-warning btn-pill"> Cancel</a>
                            @endif
        
                            @if ($order->isDelivered())
                                <a href="#" class="btn btn-block  btn-success btn-pill" onclick="event.preventDefault();
                                document.getElementById('complete-form-{{ $order->id }}').submit();"> Mark as Completed</a>
        
                                {!! Form::open(['url' => 'admin/orders/complete/'. $order->id, 'id' => 'complete-form-'. $order->id, 'style' => 'display:none']) !!}
                                {!! Form::close() !!}
                            @endif
        
                            @if (!in_array($order->status, [\App\Models\Order::DELIVERED, \App\Models\Order::COMPLETED]))
                                <a href="#" class="btn btn-block mb-3 btn-secondary btn-pill delete" order-id="{{ $order->id }}"> Remove</a>
        
                                {!! Form::open(['url' => 'admin/orders/'. $order->id, 'class' => 'delete', 'id' => 'delete-form-'. $order->id, 'style' => 'display:none']) !!}
                                {!! Form::hidden('_method', 'DELETE') !!}
                                {!! Form::close() !!}
                            @endif
                        @else
                            <a href="{{ url('admin/orders/restore/'. $order->id)}}" class="btn btn-block mb-3 btn-outline-secondary btn-pill restore"> Restore</a>
                            <a href="#" class="btn btn-block  btn-danger btn-pill delete" order-id="{{ $order->id }}"> Remove Permanently</a>
        
                            {!! Form::open(['url' => 'admin/orders/'. $order->id, 'class' => 'delete', 'id' => 'delete-form-'. $order->id, 'style' => 'display:none']) !!}
                            {!! Form::hidden('_method', 'DELETE') !!}
                            {!! Form::close() !!}
                        @endif
                </div>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- this row will not appear when printing -->
            <div class="row no-print">
              {{-- <div class="col-12">
                <a href="invoice-print.html" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
                <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
                  Payment
                </button>
                <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                  <i class="fas fa-download"></i> Generate PDF
                </button>
              </div> --}}
            </div>
          </div>
    </div>
</div>

@endsection

@push('javascript-internal')
<script>
  $(".delete").on("click", function () {
      return confirm("Do you want to remove this?");
  });
</script>
@endpush