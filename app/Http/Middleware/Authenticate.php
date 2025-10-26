<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class Authenticate
{
    public function handle(Request $request, Closure $next): Response
    {
        // Jika belum login, arahkan ke /
        if (!Auth::check()) {
            return redirect('/');
        }

        return $next($request);
    }
}
