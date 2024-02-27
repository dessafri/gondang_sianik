@extends('layout.app')
@section('title','Monitor Antrian')
@section('monitor_antrian','active')
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
                    <h5 class="breadcrumbs-title col s5"><b>Monitor Antrian</b></h5>
                    <ol class="breadcrumbs col s7 right-align">
                    </ol>
                </div>
            </div>
        </div>
    </div>
    @if($monitors)
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
                                                        <th>{{__('messages.reports.service')}}</th>
                                                        <th>Diproses</th>
                                                        <th>Total Antrian Hari ini</th>
                                                        <th>Sudah Dipanggil</th>
                                                        <th>Belum Dipanggil</th>
                                                        <th>Dilayani</th>
                                                        <th>Tidak Hadir</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($monitors as $key=>$monitor)
                                                    <tr>
                                                        <td>{{ $key+1 }}</td>
                                                        <td>{{$monitor->service_name}}</td>
                                                        <td>{{$monitor->letter_called}} - {{$monitor->number_called}}</td>
                                                        <td>{{$monitor->total_antrian}}</td>
                                                        <td>{{$monitor->terpanggil}}</td>
                                                        <td>{{$monitor->belum_dipanggil}}</td>
                                                        <td>{{$monitor->dilayani}}</td>
                                                        <td>{{$monitor->tidak_hadir}}</td>
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
    $(document).ready(function() {
        $('body').addClass('loaded');
    });
</script>
@endsection