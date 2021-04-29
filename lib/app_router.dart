import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class AppRouter {
  static const String homeScreenRoute = '/';
  static const String aboutUsScreenRoute = '/about-us';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => DefaultScreen(settings));
    }
  }

  static Scaffold DefaultScreen(RouteSettings settings) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  }
}
