import 'package:code_bangladesh_mobile_app/utils/data_fetcher.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/home_screen/home_screen_future_builder.dart';
import 'package:code_bangladesh_mobile_app/common_ui/nav_drawer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sendAnalyticsEvent(context);
    return new Scaffold(
      appBar: AppBarBuilder.buildAppBar(context),
      drawer: NavDrawerBuilder.buildNavDrawer(context),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade100),
        child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Center(
              child: HomeScreenFutureBuilder.buildFutureBuilder(DataFetcher.fetch()),
            )),
      ),
    );
  }

  Future<void> _sendAnalyticsEvent(BuildContext context) async {
    FirebaseAnalytics analytics = Provider.of<FirebaseAnalytics>(context, listen: false);
    analytics.setCurrentScreen(screenName: 'HomeScreen');
    await analytics.logEvent(
      name: 'HomeScreen',
      parameters: {},
    );
  }
}
