<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class SesiController extends Controller
{
    function index()
    
    {
        return view('login');
    }
    function login(Request $request){
        $request->validate([
            'email'=>'required', 
            'password'=>'required',
        ],[
            'email.required'=>'email wajib diisi',
            'password.required'=>'password wajib diisi',
        ]);
        $infologin =[
            'email'=> $request->email,
            'password'=> $request->password,
        ];
        if(Auth::attempt($infologin)){
           return redirect('/home');   
        }else{
            return redirect('')->withErrors('Username dan password tidak sesuai')-> withInput();
        }
    }
    public function logout(Request $request)
{
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();

    return redirect('/');
}

}