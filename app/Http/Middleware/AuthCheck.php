<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        // return $next($request)->header('Cache-Control', 'no-cache, no-store, max-age=0, must-revalidate')
        //     ->header('Pragma', 'no-cache')
        //     ->header('Expires', 'Sat 01 Jan 1990 00:00:00 GMT');


        // Debug the session data by dumping the session content
        // dd($request->session()->all());  // This will show all session data
        //$email = $request->session()->get('LoggedUser','default');
        $user_id = $request->session()->get('LoggedUser','default');
        if($user_id == 'default'){
            return redirect('/user/login');
        }else{
            //$request->headers->set('email',$email);
            $request->headers->set('id',$user_id);
            return $next($request);
        }
    }
}
