package org.codebangladesh.ui

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import org.codebangladesh.ui.dto.AppDataResponseDto
import org.codebangladesh.ui.dto.CategoryResponseDto
import org.codebangladesh.ui.dto.CourseResponseDto

class SharedViewModel : ViewModel() {

    private val _appData = MutableLiveData<AppDataResponseDto>()
    val appDataLiveData: LiveData<AppDataResponseDto> get() = _appData

    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> get() = _isLoading

    private val _errorMessage = MutableLiveData<String>()
    val errorMessage: LiveData<String> get() = _errorMessage

    fun getCategory(categoryName: String): CategoryResponseDto? =
        _appData.value?.categories?.find { it.name == categoryName }

    fun getCourse(categoryName: String, courseName: String): CourseResponseDto? =
        _appData.value?.categories?.find { it.name == categoryName }?.courses?.find { it.name == courseName }

    fun setLoading(value: Boolean) {
        _isLoading.postValue(value)
    }

    fun setData(value: AppDataResponseDto) {
        _appData.postValue(value)
    }

    fun setErrorMessage(value: String) {
        _errorMessage.postValue(value)
    }
}