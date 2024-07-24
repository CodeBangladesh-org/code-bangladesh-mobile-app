package org.codebangladesh.ui.dto

data class AppDataResponseDto(
    val siteConf: SiteConfResponseDto,
    val categories: List<CategoryResponseDto>,
    val companies: List<CompanyResponseDto>
)

data class SiteConfResponseDto(
    val headerText: String,
    val description: String,
    val email: String,
    val discordInvite: String,
    val githubLink: String
)

data class CategoryResponseDto(
    val id: String,
    val name: String,
    val description: String,
    val imageSource: String,
    val numberOfCourses: String,
    val numberOfVideos: String,
    val numberOfTopics: String,
    val popularTopics: List<String>,
    val filename: String,
    val courses: List<CourseResponseDto>
)

data class CompanyResponseDto(
    val name: String,
    val technologies: List<String>,
    val officeLocation: String,
    val webPresence: String
)

data class CourseResponseDto(
    val id: String,
    val name: String,
    val description: String,
    val imageSource: String,
    val categoryId: String,
    val numberOfVideos: Int,
    val topics: List<String>,
    val complexity: String,
    val instructors: List<InstructorResponseDto>,
    val content: List<ContentResponseDto>,
    val filename: String
)

data class InstructorResponseDto(
    val name: String,
    val link: String
)
data class ContentResponseDto(
    val name: String,
    val videoLink: String,
    val description: String
)