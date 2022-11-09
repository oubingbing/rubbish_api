<?php

use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'admin','namespace' => 'Admin','middleware'=>['web']], function () {

    Route::group(['middleware'=>['authUser']], function () {

    });
});

