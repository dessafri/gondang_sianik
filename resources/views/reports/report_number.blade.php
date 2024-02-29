@extends('layout.app')
@section('title','Report Nomor Antrian')
@section('report','active')
@section('report_number','active')
@section('css')
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/data-tables/css/jquery.dataTables.min.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/data-tables/css/select.dataTables.min.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/data-tables.css')}}">
@endsection
@section('content')
<div id="main">
    <div id="breadcrumbs-wrapper">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <h5 class="breadcrumbs-title col s5"><b>Report Nomor Antrian</b></h5>
                    <ol class="breadcrumbs col s7 right-align">
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col s12 m12 l12">
            <div id="inline-form" class="card card card-default scrollspy">
                <div class="card-content">
                    <form action="{{route('report_number')}}" id="report_number_form" autocomplete="off">
                        <div class="row">
                            <div class="input-field col m5 s4">
                                <input id="date" name="date" type="text" class="datepicker" data-error=".date" value="{{$date}}">
                                <label for="date">{{__('messages.reports.starting date')}}</label>
                                <div class="date">
                                    @if ($errors->has('date'))
                                    <span class="text-danger errbk">{{ $errors->first('date') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="input-field col m2 s2">
                                <div class="input-field col s12">
                                    <button class="btn waves-effect waves-light" id="gobtn" type="submit">
                                        {{__('messages.reports.go')}}</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @if($report_numbers)
    <div class="col s12">
        <div class="container" style="width: 99%;">
            <div class="section-data-tables">
                <div class="row">
                    <div class="col s12">
                        <div class="card">
                            <div class="card-content">
                                <div class="row">
                                    <div class="col s12">
                                        <div class="table-responsive">
                                            <table id="page-length-option" class="display dataTable">
                                                <thead>
                                                    <tr>
                                                        <th width="10px">#</th>
                                                        <th>Nomor</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($report_numbers as $index => $data)
                                                    <tr>
                                                        <td>{{ $index + 1 }}</td>
                                                        <td>{{ $data->phone }}</td>
                                                        <td>{{ $data->total }}</td>
                                                    </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif
</div>
@endsection
@section('js')
<script src="{{asset('app-assets/vendors/data-tables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/data-tables/js/dataTables.select.min.js')}}"></script>
<script>
    $(document).ready(function() {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd'
        });

        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // Januari dimulai dari 0
        var yyyy = today.getFullYear();
        var currentDate = yyyy + '-' + mm + '-' + dd;

        $('#date').val(currentDate);

        $('body').addClass('loaded');

        var date = $('#date').val();

        if (date == "") {
            $('#gobtn').attr('disabled', 'disabled');
        } else {
            $('#gobtn').removeAttr('disabled');
        }

    });

    $('#date').change(function(event) {
        let date = $('#date').val();

        if (date == "") {
            $('#gobtn').attr('disabled', 'disabled');
        } else {
            $('#gobtn').removeAttr('disabled');
        }
    });

    $('#report_number_form').validate({
        rules: {
            date: {
                required: true,
            },
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            var placement = $(element).data('error');
            if (placement) {
                $(placement).append(error)
            } else {
                error.insertAfter(element);
            }
        }
    });

    $('#page-length-option').DataTable({
        "responsive": true,
        "autoHeight": false,
        "searching": true,
        "scrollX": true,
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ]
    });
</script>
@endsection