import 'package:code_bangladesh_mobile_app/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CodeBangladesh.org',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.homeScreenRoute);
  }
}
