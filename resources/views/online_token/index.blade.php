@extends('layout.call_page')
@section('content')
    <style>
        #modal1 {
            width: 50%;
            height: 15%;
        }
    </style>
    <?php    
    $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'http://lasmini.cloud/api/decrypt',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS =>'{
        "data": {
                "token":"'.$_GET['q'].'"
            }
        }',
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'Cookie: PHPSESSID=fib4rasu96joh5opks1ubre3g5'
        ),
        ));

    $response = curl_exec($curl);
    curl_close($curl);

    $data = json_decode($response);

    if (isset($data->data->phone)) {
        $phone = $data->data->phone;
        $email = $data->data->id;
    } else {
        $phone = null; 
        $email = null;
    }
    ?>
<!-- BEGIN: Page Main-->
<div id="loader-wrapper">
    <div id="loader"></div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<div id="main" class="noprint" style="padding: 15px 15px 0px;">
    <div class="wrapper">
        <section class="content-wrapper no-print">
            <div class="container no-print">
                <div class="row">
                    <div class="col s12">
                        <div class="card" style="background:#f9f9f9;box-shadow:none" id="service-btn-container">
                            <span class="card-title" style="line-height:1;font-size:70px"> {{__('messages.issue_token.click one service to issue token')}}</span>
                            <div class="divider" style="margin:10px 0 10px 0;"></div>
                            <center>
                            @foreach($services as $service)
                            <span class="btn btn-queue waves-effect waves-light mb-1" id="service_id_24" style="background: #009688; height: 100px; font-size: 50px; align:center; display: flex; justify-content: center; align-items: center;" onclick="queueDept({{$service}})">
                                {{$service->name}}
                            </span>
                            @endforeach
                            </center>
                        </div>
                    </div>

                    <form action="{{route('create-token-online')}}" method="post" id="my-form-two" style="display: none;">
                        {{csrf_field()}}
                    </form>
                </div>
            </div>
        </section>
    </div>

    <!-- Modal Structure -->
    <div id="modal1" class="modal modal-fixed-footer">
        <form id="details_form">
            <div class="modal-content" style="padding-bottom:0">
                <div id="inline-form">
                    <div class="card-content">
                        <div class="row">
                            <div class="input-field col s10" id="date_tab">
                                <input id="date" name="date" type="date" value="" data-error=".date">
                                <label for="date">Pilih Tanggal</label>
                                <div class="date">
                                </div>
                            </div>
                            <input type="hidden" name="name" id="name" value="<?=$_GET['q']?>">
                            <input type="hidden" name="email" id="email" value="<?=$email?>">
                            <input type="hidden" name="phone" id="phone" value="<?=$phone?>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="modal_button" type="submit" class="modal-action waves-effect waves-green btn-flat btn-lg btn-block" style="background: #009688; color:#fff;" onclick="issueToken()">{{__('messages.common.submit')}}</button>
            </div>
        </form>
    </div>
</div>
@endsection
<div id="printarea" class="printarea" style="text-align:center;margin-top: 100px; display:none">
</div>
@section('js')
<script>
    $(document).ready(function() {
        $('body').addClass('loaded');
        $('.modal').modal();
    })
    var service;
    
    function queueDept(value) {        
        service = value;
        $('#modal_button').removeAttr('disabled');
        $('#modal1').modal('open');
    }

    function downloadImage(data) {
        $.ajax({
            type: "POST",
            url: "{{route('create-token-online')}}",
            data: data,
            cache: false,
            success: function(response) {
                if (response.status_code == 200) {
                    const content = `
                        <br><br>
                        <h4 style="font-size: 20px; font-weight: bold; margin-top:-15px; margin-left: 10px;">${response.settings.name} ${response.settings.location}</h4>
                        <h4 style="font-size: 20px; margin-top:-15px; margin-left: 60px;">${response.queue.service.name}</h4>
                        <h3 style="font-size: 40px;  font-weight: bold; margin-top:-30px; margin-bottom:15px; margin-left: 80px;">${response.queue.letter} - ${response.queue.number}</h3>
                        <h4 style="font-size: 24px; margin-top: -16px;margin-bottom: 27px; margin-left: 40px;">${response.queue.formated_date}</h4>
                        <h4 style="font-size: 15px; margin-top:-12px; margin-left: 80px;">Silahkan datang pada <br>tanggal yang tertera</h4>
                    `;

                    // Membuat elemen baru untuk menampung konten HTML
                    const tempElement = document.createElement('div');
                    tempElement.innerHTML = content;
                    document.body.appendChild(tempElement);

                    // Mendapatkan lebar dan tinggi dari elemen
                    const width = 300; // Menyesuaikan lebar gambar
                    const height = 300; // Menyesuaikan tinggi gambar

                    // Membuat gambar dari elemen
                    html2canvas(tempElement, { width: width, height: height }).then(function (canvas) {
                        // Mengonversi ke format gambar PNG
                        const imageData = canvas.toDataURL('image/png');

                        // Membuat elemen untuk tautan unduhan
                        const link = document.createElement('a');
                        link.download = 'Nomor Antrian.png';
                        link.href = imageData;

                        // Menambahkan elemen ke dalam dokumen dan mengkliknya secara otomatis
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);

                        // Menghapus elemen temporer setelah digunakan
                        document.body.removeChild(tempElement);
                    });
                    
                    $('body').addClass('loaded');
                    $('#modal1').modal('close');
                } else if (response.status_code == 422 && response.errors) {
                    $('body').addClass('loaded');
                    $('#modal1').modal('close');
                    M.toast({
                        html: response.errors.limit[0],
                        classes: "toast-error"
                    });
                }
            }
        });
    }

    function issueToken() {
        $('#details_form').validate({
            rules: {
                date: {
                    required: function(element) {
                        return service.date_required == "1";
                    },
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
            },
            submitHandler: function(form) {
                $('#modal_button').attr('disabled', 'disabled');
                $('body').removeClass('loaded');

                // Mendapatkan nilai dari input datetime-local
                let dateInput = document.getElementById('date');
                let selectedDateTime = dateInput.value;
                let formattedDate = new Date(selectedDateTime).toISOString().slice(0, 19).replace('T', ' ');

                let data = {
                    service_id: service.id,
                    date: formattedDate,
                    name: $('#name').val(),
                    email: $('#email').val(),
                    phone: $('#phone').val(),
                    with_details: true
                }
                
                downloadImage(data);
            }
        });
    }
</script>
@endsection()