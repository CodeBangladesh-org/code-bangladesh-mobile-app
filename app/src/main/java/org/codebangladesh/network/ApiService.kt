package org.codebangladesh.network

import org.codebangladesh.ui.dto.AppDataResponseDto
import retrofit2.Call
import retrofit2.http.GET

interface ApiService {

    @GET("/assets/generated/app-data.json")
    fun fetchAppData(): Call<AppDataResponseDto>
}