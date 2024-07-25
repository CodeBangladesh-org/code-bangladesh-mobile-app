package org.codebangladesh.ui

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import org.codebangladesh.network.RetrofitInstance
import org.codebangladesh.ui.dto.AppDataResponseDto
import org.codebangladesh.ui.dto.CategoryResponseDto
import org.codebangladesh.ui.dto.CourseResponseDto
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class SharedViewModel : ViewModel() {

    private val _appData = MutableLiveData<AppDataResponseDto>()
    val appDataLiveData: LiveData<AppDataResponseDto> get() = _appData

    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> get() = _isLoading

    fun getCategory(categoryName: String): CategoryResponseDto? =
        _appData.value?.categories?.find { it.name == categoryName }


    fun getCourse(categoryName: String, courseName: String): CourseResponseDto? =
        _appData.value?.categories?.find { it.name == categoryName }?.courses?.find { it.name == courseName }

    init {
        fetchAppData()
    }

    private fun fetchAppData() {
        _isLoading.value = true

        RetrofitInstance.api.fetchAppData().enqueue(object : Callback<AppDataResponseDto> {
            override fun onResponse(
                call: Call<AppDataResponseDto>,
                response: Response<AppDataResponseDto>
            ) {
                if (response.isSuccessful) {
                    response.body()?.let { appData ->
                        _appData.postValue(appData)
                    }
                } else {
                    Log.e("SharedViewModel", "Error response: ${response.errorBody()?.string()}")
                }
                _isLoading.postValue(false)
            }

            override fun onFailure(call: Call<AppDataResponseDto>, t: Throwable) {
                Log.e("SharedViewModel", "API call failed. Exception: ${t.message}", t)
                _isLoading.postValue(false)
            }
        })
    }
}