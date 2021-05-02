import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/common_ui/nav_drawer.dart';
import 'package:code_bangladesh_mobile_app/course_screen/course_screen.dart';
import 'package:code_bangladesh_mobile_app/dto/category_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/category_stat_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/course_response_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  final CategoryResponseDTO category;

  CategoryScreen({Key key, @required this.categoryId, @required this.category}) : super(key: key);

  @override
  CategoryScreenState createState() => new CategoryScreenState(category: category);
}

class CategoryScreenState extends State<CategoryScreen> {
  final CategoryResponseDTO category;

  CategoryScreenState({this.category});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBarBuilder.buildAppBar(context),
      drawer: NavDrawerBuilder.buildNavDrawer(context),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
          child: ListView(
            children: <Widget>[
              _buildHeader(category.name, category.description, category.imageSource),
              SizedBox(height: 15.0),
              _buildStatInfo(category.stat),
              SizedBox(height: 15.0),
              _buildCoursesInfo(context, category.courses),
            ],
          )),
    );
  }

  Widget _buildHeader(String name, String description, String imagePath) {
    return Card(
        child: ListTile(
            title: Text(
              name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              description,
              style: TextStyle(),
            ),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 60,
                minHeight: 60,
                maxWidth: 60,
                maxHeight: 60,
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            )));
  }

  Widget _buildStatInfo(CategoryStatResponseDTO stat) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
      Expanded(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
            maxWidth: 25,
            maxHeight: 25,
          ),
          child: Image.asset("assets/img/learning.png", fit: BoxFit.contain),
        ),
      ),
      Expanded(
        child: Text(stat.numberOfCourses + "টি কোর্স"),
      ),
      Expanded(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
            maxWidth: 25,
            maxHeight: 25,
          ),
          child: Image.asset("assets/img/youtube.png", fit: BoxFit.contain),
        ),
      ),
      Expanded(
        child: Text(stat.numberOfVideos + "টি ভিডিও"),
      ),
      Expanded(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
            maxWidth: 25,
            maxHeight: 25,
          ),
          child: Image.asset("assets/img/book.png", fit: BoxFit.contain),
        ),
      ),
      Expanded(
        child: Text(stat.numberOfTopics + "টি টপিকস"),
      ),
    ]);
  }

  Column _buildCoursesInfo(BuildContext context, List<CourseResponseDTO> courses) {
    return Column(children: <Widget>[
      for (int i = 0; i < courses.length; i++) _buildCourseInfo(context, courses[i]),
    ]);
  }

  Widget _buildCourseInfo(BuildContext context, CourseResponseDTO course) {
    return new InkWell(
      splashColor: Colors.blue.shade200,
      onTap: () {
        print("tapped");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(courseId: course.id, course: course),
          ),
        );
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: <Widget>[
              Flexible(
                  child: Text(
                course.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue.shade500),
              ))
            ]),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Row(children: <Widget>[
              Flexible(
                  child: Text(
                course.description,
                style: TextStyle(),
              ))
            ]),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Row(children: <Widget>[
              Image.asset(
                "assets/img/youtube.png",
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5.0),
              Text(" " + course.numberOfVideos + "টি ভিডিও"),
            ]),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Row(children: <Widget>[
              Image.asset(
                "assets/img/tag.png",
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5.0),
              Flexible(child: Text(course.topicsCommaSeparated)),
            ]),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Row(children: <Widget>[
              Image.asset(
                "assets/img/instructor.png",
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5.0),
              Flexible(child: Text(course.instructorsCommaSeparated)),
            ]),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Row(children: <Widget>[
              Image.asset(
                "assets/img/complexity.png",
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5.0),
              Flexible(child: Text(course.complexity)),
            ]),
            SizedBox(height: 25.0),
          ])),
    );
  }
}
