package org.codebangladesh.network

import android.util.Log
import com.google.android.apps.common.testing.accessibility.framework.BuildConfig
import com.google.gson.FieldNamingPolicy
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.codebangladesh.ui.SharedViewModel
import org.codebangladesh.ui.dto.AppDataResponseDto
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import java.util.concurrent.TimeUnit

class AppDataService(private val sharedViewModel: SharedViewModel) {

    private val gson: Gson = GsonBuilder()
        .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
        .create()

    private val client = OkHttpClient.Builder().apply {
        connectTimeout(10, TimeUnit.SECONDS)
        addLoggingInterceptorIfDebug()
    }.build()

    private val api: FetchDataService by lazy {
        Retrofit.Builder()
            .baseUrl(Companion.BASE_URL)
            .client(client)
            .addConverterFactory(GsonConverterFactory.create(gson))
            .build()
            .create(FetchDataService::class.java)
    }

    fun init() {
        sharedViewModel.setLoading(true)
        api.fetchAppData().enqueue(object : Callback<AppDataResponseDto> {
            override fun onResponse(
                call: Call<AppDataResponseDto>,
                response: Response<AppDataResponseDto>
            ) {
                if (response.isSuccessful) {
                    response.body()?.let { appData ->
                        sharedViewModel.setData(appData)
                    }
                } else {
                    Log.e("SharedViewModel", "Error response: ${response.errorBody()?.string()}")
                    sharedViewModel.setErrorMessage(SERVER_ERROR_MESSAGE)
                }
                sharedViewModel.setLoading(false)
            }

            override fun onFailure(call: Call<AppDataResponseDto>, t: Throwable) {
                Log.e("SharedViewModel", "API call failed. Exception: ${t.message}", t)
                sharedViewModel.setLoading(false)
                sharedViewModel.setErrorMessage(INTERNET_ERROR_MESSAGE)
            }
        })
    }

    private fun OkHttpClient.Builder.addLoggingInterceptorIfDebug(): OkHttpClient.Builder {
        if (BuildConfig.DEBUG) {
            val loggingInterceptor = HttpLoggingInterceptor().apply {
                level = HttpLoggingInterceptor.Level.BODY
            }
            this.addInterceptor(loggingInterceptor)
        }
        return this
    }

    interface FetchDataService {

        @GET("/assets/generated/app-data.json")
        fun fetchAppData(): Call<AppDataResponseDto>
    }

    companion object {
        private const val BASE_URL = "https://codebangladesh.org/"
        private const val SERVER_ERROR_MESSAGE =
            "দুঃখিত, সার্ভারে সাময়িক সমস্যার জন্য অ্যাপটি কাজ করছে না।"
        private const val INTERNET_ERROR_MESSAGE =
            "দুঃখিত, ইন্টারনেট সমস্যার জন্য অ্যাপটি কাজ করছে না।"
    }
}