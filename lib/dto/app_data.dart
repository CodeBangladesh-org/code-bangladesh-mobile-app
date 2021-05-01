class AppDataResponseDTO {
  final String headerText;
  final String description;
  final List<CategoryResponseDTO> categories;

  AppDataResponseDTO({this.headerText, this.description, this.categories});

  factory AppDataResponseDTO.fromJson(Map<String, dynamic> appDataJson) {
    final categoryJsonArray = appDataJson['categories'].cast<Map<String, dynamic>>();

    List<CategoryResponseDTO> categories = categoryJsonArray
        .map<CategoryResponseDTO>((categoryJsonObj) => CategoryResponseDTO.fromJson(categoryJsonObj))
        .toList();

    return AppDataResponseDTO(
        headerText: appDataJson['headerText'] as String,
        description: appDataJson['description'] as String,
        categories: categories);
  }
}

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
        .cast<Map<String, dynamic>>()
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
        .cast<Map<String, dynamic>>()
        .map<CourseContentResponseDTO>((contentJsonObj) => CourseContentResponseDTO.fromJson(contentJsonObj))
        .toList();

    List<CourseInstructorResponseDTO> instructors = courseJsonObj['instructors']
        .cast<Map<String, dynamic>>()
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
      numberOfVideos: Utils.toBanglaNumber((courseJsonObj['number_of_videos'] as int).toString()),
      topics: topics,
      topicsCommaSeparated: topicsCommaSeparated,
      instructors: instructors,
      instructorsCommaSeparated: instructorsCommaSeparated,
      complexity: courseJsonObj['complexity'] as String,
      content: content,
    );
  }
}

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

class Utils {
  static String toBanglaNumber(String number) {
    final String banglaDigits = "০১২৩৪৫৬৭৮৯";
    return number.split('').map((ch) => banglaDigits[int.parse(ch)]).join();
  }
}
