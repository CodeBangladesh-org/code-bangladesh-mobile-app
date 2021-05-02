class CourseContentResponseDTO {
  final String name;
  final String description;
  final String videoLink;

  CourseContentResponseDTO({
    this.name,
    this.description,
    this.videoLink,
  });

  factory CourseContentResponseDTO.fromJson(Map<String, dynamic> json) {
    return CourseContentResponseDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      videoLink: json['video_link'] as String,
    );
  }
}
