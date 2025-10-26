<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    public function handle(Request $request, Closure $next): Response
    {
        // Jika sudah login, arahkan ke /home
        if (Auth::check()) {
            return redirect('/home');
        }

        // Jika belum login, lanjutkan saja
        return $next($request);
    }
}
