import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/course_screen/course_screen.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/nav_drawer/nav_drawer.dart';
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
      appBar: AppBarBuilder.buildAppBar(),
      drawer: NavDrawer.getNavDrawer(context),
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
    return Column(children: <Card>[
      for (int i = 0; i < courses.length; i++) _buildCourseInfo(context, courses[i]),
    ]);
  }

  Widget _buildCourseInfo(BuildContext context, CourseResponseDTO course) {
    return new Card(
        elevation: 0.0,
        color: Colors.white,
        child: new InkWell(
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
            child: Card(
                color: Colors.blue.shade50,
                child: ListTile(
                    title: Text(
                      course.name,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      course.description,
                      style: TextStyle(),
                    )))));
  }
}
