import 'package:code_bangladesh_mobile_app/dto/course_content_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/course_instructor_response_dto.dart';
import 'package:code_bangladesh_mobile_app/utils/app_utils.dart';

class CourseResponseDTO {
  final String id;
  final String name;
  final String description;
  final String imageSource;
  final String categoryId;
  final String numberOfVideos;
  final List<String> topics;
  final String topicsCommaSeparated;
  final List<CourseInstructorResponseDTO> instructors;
  final String instructorsCommaSeparated;
  final String complexity;
  final List<CourseContentResponseDTO> content;

  CourseResponseDTO(
      {this.id,
      this.name,
      this.description,
      this.imageSource,
      this.categoryId,
      this.numberOfVideos,
      this.topics,
      this.topicsCommaSeparated,
      this.instructors,
      this.instructorsCommaSeparated,
      this.complexity,
      this.content});

  factory CourseResponseDTO.fromJson(Map<String, dynamic> courseJsonObj) {
    List<CourseContentResponseDTO> content = courseJsonObj['content']
        .map<CourseContentResponseDTO>((contentJsonObj) => CourseContentResponseDTO.fromJson(contentJsonObj))
        .toList();

    List<CourseInstructorResponseDTO> instructors = courseJsonObj['instructors']
        .map<CourseInstructorResponseDTO>(
            (instructorJsonObj) => CourseInstructorResponseDTO.fromJson(instructorJsonObj))
        .toList();
    String instructorsCommaSeparated = instructors.map((instructor) => instructor.name).toList().join(", ");

    List<String> topics = List<String>.from(courseJsonObj['topics']);
    String topicsCommaSeparated = List<String>.from(courseJsonObj['topics']).join(", ");

    return CourseResponseDTO(
      id: courseJsonObj['id'] as String,
      name: courseJsonObj['name'] as String,
      description: courseJsonObj['description'] as String,
      imageSource: (courseJsonObj['image_source'] as String).substring(1),
      categoryId: courseJsonObj['category_id'] as String,
      numberOfVideos: AppUtils.toBanglaNumber((courseJsonObj['number_of_videos'] as int).toString()),
      topics: topics,
      topicsCommaSeparated: topicsCommaSeparated,
      instructors: instructors,
      instructorsCommaSeparated: instructorsCommaSeparated,
      complexity: courseJsonObj['complexity'] as String,
      content: content,
    );
  }
}
