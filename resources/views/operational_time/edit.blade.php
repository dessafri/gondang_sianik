@extends('layout.app')
@section('title','Jam Operasional')
@section('content')
<div id="main" style="width:99%;">
    <div id="breadcrumbs-wrapper">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <h5 class="breadcrumbs-title col s5"><b>Edit Jam Operasional</b></h5>
                    <ol class="breadcrumbs col s7 right-align">
                        <a class="btn-floating waves-effect waves-light teal tooltipped" href="{{route('operational_time.index')}}" data-position=top data-tooltip="{{__('messages.common.go back')}}"><i class="material-icons">arrow_back</i></a>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="col s12">
        <div class="container">
            <div class="row">
                <div class="col  s12 m8  offset-m2">
                    <div class="card-panel">
                        <div class="row">
                            <form id="operational_time_form" method="post" action="{{route('operational_time.update',[$operational_time->id])}}">
                                {{@csrf_field()}}
                                {{method_field('PATCH')}}
                                <div class="row">
                                    <div class="row form_align">
                                        <div class="input-field col s6">
                                            <label for="on_time">Jam Buka</label>
                                            <input id="on_time" name="on_time" type="time" value="{{$operational_time->on_time}}" data-error=".on_time">
                                            <div class="on_time">
                                                @if ($errors->has('on_time'))
                                                <span class="text-danger errbk">{{ $errors->first('on_time') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="off_time">Jam Tutup</label>
                                            <input id="off_time" name="off_time" type="time" value="{{$operational_time->off_time}}" data-error=".off_time">
                                            <div class="off_time">
                                                @if ($errors->has('off_time'))
                                                <span class="text-danger errbk">{{ $errors->first('off_time') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form_align">
                                        <div class="input-field col s6">
                                            <select name="day" id="day" data-error=".day">
                                                <option value="Monday" @if($operational_time->day=='Monday') selected @endif>Senin</option>
                                                <option value="Tuesday" @if($operational_time->day=='Tuesday') selected @endif>Selasa</option>
                                                <option value="Wednesday" @if($operational_time->day=='Wednesday') selected @endif>Rabu</option>
                                                <option value="Thursday" @if($operational_time->day=='Thursday') selected @endif>Kamis</option>
                                                <option value="Friday" @if($operational_time->day=='Friday') selected @endif>Jum'at</option>
                                                <option value="Saturday" @if($operational_time->day=='Saturday') selected @endif>Sabtu</option>
                                                <option value="Sunday" @if($operational_time->day=='Sunday') selected @endif>Minggu</option>
                                            </select>
                                            <label>Hari</label>
                                            <div class="day">
                                                @if ($errors->has('day'))
                                                <span class="text-danger errbk">{{ $errors->first('day') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="input-field col s6">
                                            <select name="status" id="status" data-error=".status">
                                                <option value="Offline" @if($operational_time->status=='Offline') selected @endif>Offline</option>
                                                <option value="Online" @if($operational_time->status=='Online') selected @endif>Online</option>
                                            </select>
                                            <label>status</label>
                                            <div class="status">
                                                @if ($errors->has('status'))
                                                <span class="text-danger errbk">{{ $errors->first('status') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-field col s12">
                                        <button class="btn waves-effect waves-light right submit" type="submit" name="action">{{__('messages.common.update')}}
                                            <i class="mdi-content-send right"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('app-assets/js/vendors.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/jquery-validation/jquery.validate.min.js')}}"></script>
<script>
    $(document).ready(function() {
        $('body').addClass('loaded');
    });
    $(function() {
        $('#operational_time_form').validate({
            ignore: [],
            rules: {
                on_time: {
                    required: true,
                },
                off_time: {
                    required: true,
                },
                day: {
                    required: true,
                },
                status: {
                    required: true,
                }
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
    });
</script>
@endsection