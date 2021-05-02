class CategoryStatResponseDTO {
  final String numberOfCourses;
  final String numberOfVideos;
  final String numberOfTopics;

  CategoryStatResponseDTO({this.numberOfCourses, this.numberOfVideos, this.numberOfTopics});

  factory CategoryStatResponseDTO.fromJson(Map<String, dynamic> json) {
    return CategoryStatResponseDTO(
      numberOfCourses: json['number_of_courses'] as String,
      numberOfVideos: json['number_of_videos'] as String,
      numberOfTopics: json['number_of_topics'] as String,
    );
  }
}
