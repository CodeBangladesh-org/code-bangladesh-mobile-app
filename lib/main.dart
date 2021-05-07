import 'package:code_bangladesh_mobile_app/home_screen/home_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  static FirebaseAnalytics _analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver _observer = FirebaseAnalyticsObserver(analytics: _analytics);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseAnalytics>.value(value: _analytics),
          Provider<FirebaseAnalyticsObserver>.value(value: _observer),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CodeBangladesh.org',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            navigatorObservers: <NavigatorObserver>[_observer],
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == '/') {
                final homeSettings = RouteSettings(name: '/');
                return MaterialPageRoute(
                    settings: homeSettings, builder: (_) => HomeScreen());
              }
              return null;
            }));
  }
}
