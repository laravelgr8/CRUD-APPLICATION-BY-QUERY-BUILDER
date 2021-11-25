<!-- Language Insert
Image Upload
All record Fetch
Record Update  -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
<link rel="stylesheet" type="text/css" href="{{asset('css/bootstrap.min.css')}}">
<script type="text/javascript" src="{{asset('js/jquery.js')}}"></script>
<script type="text/javascript" src="{{asset('js/bootstrap.min.js')}}"></script>
<script type="text/javascript" src="{{asset('js/popper.min.js')}}"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xl-6">
            <form method="post" action="/update" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" value="{{@$data->id}}">
                <div class="form-group">
                    <label>Name : </label>
                    <input type="text" name="name" id="name" class="form-control" value="{{$data->name ?? ''}}">
                </div>
                <div class="form-group">
                    <label>Email : </label>
                    <input type="text" name="email" id="email" class="form-control" value="{{$data->email ?? ''}}">
                </div>
                <div class="form-group">
                    <label>Password : </label>
                    <input type="text" name="password" id="password" class="form-control" value="{{$data->password ?? ''}}">
                </div>
                <div class="form-group">
                    <label>Mobile : </label>
                    <input type="text" name="mobile" id="mobile" class="form-control" value="{{$data->mobile ?? ''}}">
                </div>
                <div class="form-group">
                    <label>Gender : </label>
                    <input type="radio" name="gender" value="Male" {{$data->gender=='Male' ? 'checked' : ''}}> Male
                    <input type="radio" name="gender" value="Female" {{$data->gender=='Female' ? 'checked' : ''}}> Female
                </div>
                @php
                $qual=explode(",",$data->qualification);
                @endphp
                <div class="form-group">
                    <label>Qualification : </label>
                    <input type="checkbox" name="qualification[]" value="MCA" {{in_array('MCA',$qual) ? 'checked' : ''}}> MCA
                    <input type="checkbox" name="qualification[]" value="BCA" {{in_array('BCA',$qual) ? 'checked' : ''}}> BCA
                    <input type="checkbox" name="qualification[]" value="B.Tech" {{in_array('B.Tech',$qual) ? 'checked' : ''}}> B.Tech
                </div>
                <div class="form-group">
                    <label>Image : </label>
                    <input type="file" name="new_pic" id="new_pic" class="form-group">
                    <input type="hidden" name="old_pic" value="{{@$data->pic}}">

                </div>
                <div class="form-group">
                    <label>Country : </label>
                    <select class="form-control" id="country" name="country">
                        <option>Select Country</option>
                        @foreach($countrys as $country)
                        <option value="{{$country->id}}" {{$data->countryID==$country->id ? 'selected' : ''}}>{{$country->country_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>State : </label>
                    <select class="form-control" id="state" name="state">
                      @foreach($states as  $state)
                      <option value="{{@$state->id}}" {{$state->id==$data->stateID ? 'selected' : ''}}>{{@$state->state_name}}</option>
                      @endforeach  
                    </select>
                </div>
                <div class="form-group">
                    <label>City : </label>
                    <select class="form-control" id="city" name="city">
                        @foreach($cities as $city)
                        <option value="{{@$city->id}}" {{@$city->id==$data->cityID ? 'selected' : ''}}>{{@$city->city_name}}</option>
                        @endforeach
                    </select>
                </div>
                @php
                $la=[1,4];
                $ary=array("Hindi"=>1,"English"=>2,"Bhojpuri"=>3,"Panjabi"=>4,"Tamil"=>5);
                @endphp
                <!-- in_array($value,$data_arr) ? 'selected' : '' -->
                <div class="form-group">
                    <label>Language : </label>
                    <select class="form-control" id="lang" name="lang[]" multiple>
                        <!-- <option value="1">Hind</option>
                        <option value="2">English</option>
                        <option value="3">Bhojpuri</option>
                        <option value="4">Panjabi</option>
                        <option value="5">Tamil</option> -->
                        @foreach($ary as $key => $value)
                        <option value="{{$value}}" {{in_array($value,$data_arr) ? 'selected' : ''}}>{{$key}}</option>
                        @endforeach
                    </select>
                </div>
                <input type="submit" class="btn btn-success">
            </form>
        </div>

        
    </div>
</div>

<script type="text/javascript" src="{{asset('js/jquery.js')}}"></script>
<script>
$(document).ready(function(){

    //state get
    $("#country").change(function(){
        var country_id= $("#country").val();
        $.ajax({
            url : '/get_state',
            type: 'GET',
            data:{
                country_id:country_id
                // "_token": "{{csrf_token()}}"
            },
            success:function(data)
            {
                $("#state").html(data);
                // var i;
                // var html;
                // for(i=0;i<data.length;i++)
                // {
                //     html+="<option>"+data[i].state_name+"<option>";
                // }
                // $("#state").append(html);
            }
        });
    });


    //city get
    $(document).on("change","#state,#country",function(){
        var state_id=$("#state").val();
        // console.log(state_id);
        $.ajax({
            url : '/get_city',
            type:'GET',
            data:{state_id:state_id},
            success:function(data)
            {
                $("#city").html(data);
            }
        });
    });
});   
</script>
</body>
</html>