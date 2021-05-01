import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/common_ui/nav_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseScreen extends StatefulWidget {
  final String courseId;
  final CourseResponseDTO course;

  CourseScreen({Key key, @required this.courseId, @required this.course}) : super(key: key);

  @override
  CourseScreenState createState() => new CourseScreenState(course: course);
}

class CourseScreenState extends State<CourseScreen> {
  final CourseResponseDTO course;

  CourseScreenState({this.course});

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
              _buildHeader(course.name, course.description, course.imageSource),
              SizedBox(height: 15.0),
              // _buildStatInfo(category.stat),
              // SizedBox(height: 15.0),
              _buildCoursesInfo(context, course.content),
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

  Column _buildCoursesInfo(BuildContext context, List<CourseContentResponseDTO> contents) {
    return Column(children: <Card>[
      for (int i = 0; i < contents.length; i++) _buildCourseInfo(context, contents[i]),
    ]);
  }

  Widget _buildCourseInfo(BuildContext context, CourseContentResponseDTO content) {
    return new Card(
        elevation: 0.0,
        color: Colors.white,
        child: new InkWell(
            splashColor: Colors.blue.shade200,
            onTap: () => launch(content.videoLink),
            child: Card(
                color: Colors.blue.shade50,
                child: ListTile(
                    title: Text(
                      content.name,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue.shade500),
                    ),
                    subtitle: Text(
                      content.description,
                      style: TextStyle(),
                    )))));
  }
}
