import 'package:code_bangladesh_mobile_app/dto/category_stat_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/course_response_dto.dart';

class CategoryResponseDTO {
  final String id;
  final String name;
  final String description;
  final String imageSource;
  final CategoryStatResponseDTO stat;
  final List<CourseResponseDTO> courses;

  CategoryResponseDTO({this.id, this.name, this.description, this.imageSource, this.stat, this.courses});

  factory CategoryResponseDTO.fromJson(Map<String, dynamic> categoryJson) {
    List<CourseResponseDTO> categoryCourses = categoryJson['courses']
        .map<CourseResponseDTO>((courseJsonObj) => CourseResponseDTO.fromJson(courseJsonObj))
        .toList();

    return CategoryResponseDTO(
        id: categoryJson['id'] as String,
        name: categoryJson['name'] as String,
        description: categoryJson['description'] as String,
        imageSource: (categoryJson['image_source'] as String).substring(1),
        stat: CategoryStatResponseDTO.fromJson(categoryJson),
        courses: categoryCourses);
  }
}
