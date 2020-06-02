<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $credentials = request(['username', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return response()->json([
            'access_token' => $token,
        ]);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return response()->json([
            'access_token' => auth()->refresh(),
        ]);
    }


    public function register(Request $request)
    {
        $unique_email = DB::table('users')->where('email',$request->email)->first();
        $unique_username = DB::table('users')->where('username',$request->username)->first();

        if($unique_email)
        {
            return response()->json(['message'=>'Email đã tồn tại'],500,[],JSON_UNESCAPED_UNICODE);

        }

        if($unique_username)
        {
            return response()->json(['message'=>'Tên tài khoản đã tồn tại'],500,[],JSON_UNESCAPED_UNICODE);
        }

        $register_user = DB::table('users')->insert([
            'full_name' => $request->fullname,
            'email' => $request->email,
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            'updated_at' => Carbon::now('Asia/Ho_Chi_Minh')
        ]);

        if($register_user)
            return response()->json(['message' => 'success'],200,[],JSON_UNESCAPED_UNICODE);


    }

}