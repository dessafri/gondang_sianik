@extends('layout.call_page')
@section('content')
<!-- BEGIN: Page Main-->
<div id="loader-wrapper">
    <div id="loader"></div>

    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>

</div>
<div id="main" class="no-print" style="padding: 15px 15px 0px; background-image: url('app-assets/images/bg-antrian.png');">

    <div class="wrapper" style=" min-height: auto;" id="display-page">
        <section class="content-wrapper no-print">
            <div id="callarea" class="row" style="line-height:2;display:flex; flex-direction:row-reverse">
                <div class="col m4">
                    <div class="card-panel center-align" style="margin-bottom:0; height:40vh; display:flex; flex-direction:row; justify-content:center; align-items:center;">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <center>
                                        <span v-if="tokens[1]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[1]?.token_letter}}-@{{tokens[1]?.token_number}}</span>
                                        <span v-if="!tokens[1]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[1]" class="bolder-color" id="counter1" style="font-size:20px; font-weight:bold;">@{{tokens[1]?.counter.name}}</small>
                                        <small v-if="!tokens[1]" class="bolder-color" id="counter1" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[1]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[1]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[1] && tokens[1]?.call_status_id == null" style="font-size:20px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[1]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[2]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[2]?.token_letter}}-@{{tokens[2]?.token_number}}</span>
                                        <span v-if="!tokens[2]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[2]" class="bolder-color" id="counter2" style="font-size:20px; font-weight:bold;">@{{tokens[2]?.counter.name}}</small>
                                        <small v-if="!tokens[2]" class="bolder-color" id="counter2" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[2]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[2]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[2] && tokens[2]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[2]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[3]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[3]?.token_letter}}-@{{tokens[3]?.token_number}}</span>
                                        <span v-if="!tokens[3]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[3]" class="bolder-color" id="counter3" style="font-size:20px; font-weight:bold;">@{{tokens[3]?.counter.name}}</small>
                                        <small v-if="!tokens[3]" class="bolder-color" id="counter3" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[3]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[3]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[3] && tokens[3]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[3]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[4]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[4]?.token_letter}}-@{{tokens[4]?.token_number}}</span>
                                        <span v-if="!tokens[4]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[4]" class="bolder-color" id="counter4" style="font-size:20px; font-weight:bold;">@{{tokens[4]?.counter.name}}</small>
                                        <small v-if="!tokens[4]" class="bolder-color" id="counter4" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[4]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[4]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[4] && tokens[4]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[4]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <center>
                                        <span v-if="tokens[5]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[5]?.token_letter}}-@{{tokens[5]?.token_number}}</span>
                                        <span v-if="!tokens[5]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[5]" class="bolder-color" id="counter5" style="font-size:20px; font-weight:bold;">@{{tokens[5]?.counter.name}}</small>
                                        <small v-if="!tokens[5]" class="bolder-color" id="counter5" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[5]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[5]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[5] && tokens[5]?.call_status_id == null" style="font-size:20px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[5]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[6]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[6]?.token_letter}}-@{{tokens[6]?.token_number}}</span>
                                        <span v-if="!tokens[6]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[6]" class="bolder-color" id="counter6" style="font-size:20px; font-weight:bold;">@{{tokens[6]?.counter.name}}</small>
                                        <small v-if="!tokens[6]" class="bolder-color" id="counter6" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[6]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[6]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[6] && tokens[6]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[6]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[7]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[7]?.token_letter}}-@{{tokens[7]?.token_number}}</span>
                                        <span v-if="!tokens[7]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[7]" class="bolder-color" id="counter7" style="font-size:20px; font-weight:bold;">@{{tokens[7]?.counter.name}}</small>
                                        <small v-if="!tokens[7]" class="bolder-color" id="counter7" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[7]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[7]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[7] && tokens[7]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[7]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <span v-if="tokens[8]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{tokens[8]?.token_letter}}-@{{tokens[8]?.token_number}}</span>
                                        <span v-if="!tokens[8]" class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span><br>
                                        <small v-if="tokens[8]" class="bolder-color" id="counter8" style="font-size:20px; font-weight:bold;">@{{tokens[8]?.counter.name}}</small>
                                        <small v-if="!tokens[8]" class="bolder-color" id="counter8" style="font-size:20px; font-weight:bold;">{{__('messages.display.nil')}}</small><br>
                                        <small v-if="tokens[8]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:15px; color:#009688; font-weight:bold;">{{__('messages.display.served')}}</small>
                                        <small v-if="tokens[8]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:15px;font-weight:bold;color:red">{{__('messages.display.noshow')}}</small>
                                        <small v-if="tokens[8] && tokens[8]?.call_status_id == null" style="font-size:15px; color:orange; font-weight:bold;">{{__('messages.display.serving')}}</small>
                                        <small v-if="!tokens[8]" style="font-size:15px;">{{__('messages.display.nil')}}</small>
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col m8">
                    <div class="card-panel center-align" style="margin-bottom:0;height:40vh;display:flex;flex-direction:row;justify-content:center;align-items:center;font-size: 20px;">
                        <div>
                            <div class="bolder-color" style="font-size:20px; margin:0px">{{__('messages.display.token number')}}</div>
                            <div class="bolder-color" style="font-size:15px; line-height:1.4">@{{tokens[0]?.service.name }}</div>
                            <span v-if="tokens[0]" style="font-size:70px;color:red;font-weight:bold;line-height:1.2">@{{tokens[0]?.token_letter}}-@{{tokens[0]?.token_number}}</span>
                            <span v-if="!tokens[0]" style="font-size:70px;color:red;font-weight:bold;line-height:1.2">{{__('messages.display.nil')}}</span>
                            <div v-if="tokens[0]?.call_status_id == {{CallStatuses::SERVED}}" style="font-size:20px; color:#009688">{{__('messages.display.served')}}</div>
                            <div v-if="tokens[0]?.call_status_id == {{CallStatuses::NOSHOW}}" style="font-size:20px; color:red">{{__('messages.display.noshow')}}</div>
                            <div v-if="tokens[0] && tokens[0]?.call_status_id == null" style="font-size:20px; color:orange; font-weight: bold">{{__('messages.display.serving')}}</div>
                            <div v-if="!tokens[0]" style="font-size:20px; color:orange; font-weight: bold">{{__('messages.display.nil')}}</div>
                            <div class="bolder-color" style="font-size:20px; line-height:1.4">{{__('messages.display.please proceed to')}}</div>
                            <div v-if="tokens[0]" id="counter0" style="font-size:35px; color:red;line-height:1.5">@{{tokens[0]?.counter.name}}</div>
                            <div v-if="!tokens[0]" style="font-size:35px; color:red;line-height:1.5">{{__('messages.display.nil')}}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="callarea" class="row" style="line-height:1;display:flex; flex-direction:row-reverse">
                <div class="col m12">
                    <div class="card-panel center-align p-0" style="margin-bottom:0; height:30vh; font-size: 20px;" id="side-token-display">
                        <div class="justify-content-center" >
                            <!-- <marquee behavior="" direction=""> -->
                            <table>
                                <tr>
                                @foreach($services as $service)
                                    @php
                                        $serviceName = $service->name;
                                        $serviceId = $service->id;
                                    @endphp
                                    <td>
                                        <center>
                                            <small class="bolder-color" style="font-size:20px;font-weight:bold;color:red">{{ $serviceName }}</small><br>
                                                <div v-for="(token, index) in tokens" :key="index" >
                                                    <template v-if="token.service.id === {{ $serviceId }}">
                                                        <span class="bolder-color" style="font-size:20px;font-weight:bold;line-height:1.2">@{{ token.token_letter }}-@{{ token.token_number }}</span> -
                                                        <small class="bolder-color" :id="'counter' + index" style="font-size:15px;font-weight:bold;">@{{ token.counter.name }}</small><br>
                                                        <small v-if="token && token.call_status_id === {{ CallStatuses::SERVED }}" style="font-size:10px;color:#009688;font-weight:bold;">{{ __('messages.display.served') }}</small>
                                                        <small v-if="token && token.call_status_id === {{ CallStatuses::NOSHOW }}" style="font-size:10px;font-weight:bold;color:red">{{ __('messages.display.noshow') }}</small>
                                                        <small v-if="token && token.call_status_id === null" style="font-size:10px;color:orange;font-weight:bold;">{{ __('messages.display.serving') }}</small>
                                                    </template>
                                                </div>
                                        </center>
                                    </td>
                                    <td>
                                        &emsp;&emsp;
                                    </td>
                                @endforeach
                                </tr>
                            </table>
                            <!-- </marquee> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom:0; margin-top: 15px;">
                <marquee><span style="font-size:{{$settings->display_font_size}}px;color:{{$settings->display_font_color}}">{{$settings->display_notification ? $settings->display_notification : 'Hello' }}<span></span></span></marquee>
            </div>
            <audio id="called_sound">
                <source src="{{asset('app-assets/audio/sound.mp3')}}" type="audio/mpeg">
            </audio>
        </section>
    </div>
</div>
@endsection
@section('b-js')
<script>
    window.JLToken = {
        // get_tokens_for_display_url: "{{ asset($file) }}",
        get_tokens_for_display_url: "{{ route('get-tokens-for-display-service') }}",
        // get_tokens_for_display_url: "{{ route('get-tokens-for-display-service') }}",
        get_initial_tokens: "{{ route('get-tokens-for-display-service') }}",
        date_for_display: "{{$date}}",
        voice_type: "{{$settings->language->display}}",
        voice_content_one: "{{$settings->language->token_translation}}",
        voice_content_two: "{{$settings->language->please_proceed_to_translation}}",
        date_for_display: "{{$date}}",
        audioEl: document.getElementById('called_sound'),
    }
</script>
@endsection