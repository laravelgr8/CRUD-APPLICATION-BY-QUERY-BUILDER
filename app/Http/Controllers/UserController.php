<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class UserController extends Controller
{
    public function index()
    {
        $data=DB::table('login')
                ->select('login.id as id','login.*','country.country_name as country_name','state.state_name as state_name','city.city_name as city_name')
                ->leftjoin('country','login.countryID','=','country.id')
                ->leftjoin('state','login.stateID','=','state.id')
                ->leftjoin('city','login.cityID','=','city.id')
                ->get();
        $countrys=DB::table('country')->get();
        return view('home',compact('countrys','data'));
    }

    public function get_state(Request $request)
    {
        $country_id=$request->country_id;
        $states=DB::table('state')->where('country_id',$country_id)->get();
        $html="";
        foreach($states as $state)
        {
            $html.="<option value='".$state->id."'>".$state->state_name."</option>";
        }
        echo $html;
        // return $states;
    }

    public function get_city(Request $request)
    {
        $state_id=$request->state_id;
        $citys=DB::table('city')->where('state_id',$state_id)->get();
        $html="";
        foreach($citys as $city)
        {
            $html.="<option value='".$city->id."'>".$city->city_name."</option>";
        }
        echo $html;
    }


    public function signup(Request $request)
    {
        if($request->hasfile('pic'))
        {
            $file=$request->file('pic');
            $extension=$file->getClientOriginalExtension();
            $filename=time().'.'.$extension;
            $file->move('img/',$filename);
            $pic=$filename;
        }

        $data=DB::table('login')->insertGetId([
            "name"=>$request->name,
            "email"=>$request->email,
            "password"=>$request->password,
            "mobile"=>$request->mobile,
            "gender"=>$request->gender,
            "qualification"=>implode(",", $request->qualification),
            "countryID"=>$request->country,
            "stateID"=>$request->state,
            "cityID"=>$request->city,
            "pic"=>$pic
        ]);
        if($request->lang!='')
        {
            foreach($request->lang as $key => $value)
            {
                DB::table('language')->insert([
                    "userID"=>$data,
                    "lang"=>$value
                ]);
            }
        }
        return back()->with('msg','Data Saved');
    }

    public function edit($id)
    {
        $data=DB::table('login')->where('id',$id)->first();
        $user_id=$data->id;
        $country_id=$data->countryID;
        $state_id=$data->stateID;//get state id from login table
        $city_id=$data->cityID; //get city id from login table
        $language=DB::table('language')->where('userID',$id)->get();
        $data_arr=array();
        foreach($language as $la_value)
        {
            $data_arr[]=$la_value->lang; //lang field name
        }
        // return $data_arr;
        $countrys=DB::table('country')->get();

        $states=DB::table('state')->where('country_id',$country_id)->get();//select state through country id
        $cities=DB::table('city')->where('state_id',$state_id)->get();//select city through state id

        // $cities=DB::table('city')->where('id',$city_id)->first();
        return view('edit',compact('countrys','data','data_arr','states','cities'));
    }


    public function update(Request $request)
    {
        $id=$request->id;
        if($request->hasfile('new_pic'))
        {
            $file=$request->file('new_pic');
            $extension=$file->getClientOriginalName();
            $filename=time().'-'.$extension;
            $file->move('img/',$filename);
            $new_pic=$filename;
        }
        else
        {
            $new_pic=$request->old_pic;
        }

        DB::table('login')
            ->where('id',$id)
            ->update([
                "name"=>$request->name,
                "email"=>$request->email,
                "password"=>$request->password,
                "mobile"=>$request->mobile,
                "gender"=>$request->gender,
                "qualification"=>implode(",", $request->qualification),
                "countryID"=>$request->country,
                "stateID"=>$request->state,
                "cityID"=>$request->city,
                "pic"=>$new_pic
            ]);

        foreach($request->lang as $lan)
        {
            //agar data pahle se hai to usko update karega but new insert nahi karega
            // $d=DB::table('language')
            //     ->where('userID',$id)
            //     ->updateOrInsert([
            //         "lang"=>$lan
            //     ]);

            DB::table('language')->updateOrInsert(
                ['userID'=>$id],  //ye check karega ki hai to update nahi to insert(bou only on data)
                ['lang'=>$lan]
            );
            
        }
        return redirect()->route('index');
    }
}
