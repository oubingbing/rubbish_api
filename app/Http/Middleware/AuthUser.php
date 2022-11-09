<?php

namespace App\Http\Middleware;

use App\Http\Service\AuthService;
use App\Models\AdminModel;
use App\Models\Customer;
use Closure;

class AuthUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $authService = app(AuthService::class);
        if(!$authService->auth()){
            return redirect('/login');
        }

        $admin = AdminModel::query()
            ->where(AdminModel::FIELD_ID,$authService->authUser())
            ->select([
                AdminModel::FIELD_ID,
                AdminModel::FIELD_NICKNAME,
                AdminModel::FIELD_EMAIL,
                AdminModel::FIELD_AVATAR
            ])
            ->first();
        $request->offsetSet('user',$admin);

        return $next($request);
    }
}
