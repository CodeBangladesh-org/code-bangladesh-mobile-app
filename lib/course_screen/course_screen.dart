import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/common_ui/nav_drawer.dart';
import 'package:code_bangladesh_mobile_app/dto/course_content_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/course_response_dto.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseScreen extends StatelessWidget {
  final String courseId;
  final CourseResponseDTO course;

  CourseScreen({Key key, @required this.courseId, @required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sendAnalyticsEvent(context, course.id);
    return new Scaffold(
      appBar: AppBarBuilder.buildAppBar(context),
      drawer: NavDrawerBuilder.buildNavDrawer(context),
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
            onTap: () {
              _sendCourseViewedAnalyticsEvent(context, courseId, content.videoLink);
              return launch(content.videoLink);
            },
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

  Future<void> _sendAnalyticsEvent(BuildContext context, String courseId) async {
    FirebaseAnalytics analytics = Provider.of<FirebaseAnalytics>(context, listen: false);
    analytics.setCurrentScreen(screenName: 'CourseScreen');
    await analytics.logEvent(
      name: 'CourseScreen',
      parameters: <String, dynamic>{'courseId': courseId},
    );
  }

  Future<void> _sendCourseViewedAnalyticsEvent(BuildContext context, String courseId, String videoLink) async {
    FirebaseAnalytics analytics = Provider.of<FirebaseAnalytics>(context, listen: false);
    await analytics.logEvent(
      name: 'CourseViewed',
      parameters: <String, dynamic>{'courseId': courseId, 'videoLink': videoLink},
    );
  }
}
