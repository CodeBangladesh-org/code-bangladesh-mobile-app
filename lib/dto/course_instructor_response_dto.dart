class CourseInstructorResponseDTO {
  final String name;
  final String link;

  CourseInstructorResponseDTO({
    this.name,
    this.link,
  });

  factory CourseInstructorResponseDTO.fromJson(Map<String, dynamic> json) {
    return CourseInstructorResponseDTO(
      name: json['name'] as String,
      link: json['link'] as String,
    );
  }
}
