class AppDataResponseDTO {
  final String headerText;
  final String description;
  final List<CategoryResponseDTO> categories;
  final List<CourseResponseDTO> courses;

  AppDataResponseDTO({this.headerText, this.description, this.categories, this.courses});

  factory AppDataResponseDTO.fromJson(Map<String, dynamic> json) {
    final categoryJsons = json['categories'].cast<Map<String, dynamic>>();
    List<CategoryResponseDTO> categories =
        categoryJsons.map<CategoryResponseDTO>((categoryJson) => CategoryResponseDTO.fromJson(categoryJson)).toList();

    final courseJsons = json['courses'].cast<Map<String, dynamic>>();
    List<CourseResponseDTO> courses =
        courseJsons.map<CourseResponseDTO>((courseJson) => CourseResponseDTO.fromJson(courseJson)).toList();

    return AppDataResponseDTO(
        headerText: json['header_text'] as String,
        description: json['description'] as String,
        categories: categories,
        courses: courses);
  }
}

class CategoryResponseDTO {
  final String name;
  final String description;
  final String imageSource;

  CategoryResponseDTO({this.name, this.description, this.imageSource});

  factory CategoryResponseDTO.fromJson(Map<String, dynamic> json) {
    return CategoryResponseDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      imageSource: json['image_source'] as String,
    );
  }
}

class CourseResponseDTO {
  final String name;
  final String description;
  final String categoryId;

  CourseResponseDTO({this.name, this.description, this.categoryId});

  factory CourseResponseDTO.fromJson(Map<String, dynamic> json) {
    return CourseResponseDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      categoryId: json['category_id'] as String,
    );
  }
}
