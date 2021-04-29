import 'package:code_bangladesh_mobile_app/data_fetcher.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/home_screen/home_screen_appbar.dart';
import 'package:code_bangladesh_mobile_app/home_screen/home_screen_future_builder.dart';
import 'package:code_bangladesh_mobile_app/nav_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Future<AppDataResponseDTO> appDataFuture;

  @override
  void initState() {
    super.initState();
    appDataFuture = DataFetcher.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: HomeScreenAppBar.buildAppBar(),
      drawer: NavDrawer.getNavDrawer(context),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade50),
        child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Center(
              child: HomeScreenFutureBuilder.buildFutureBuilder(appDataFuture),
            )),
      ),
    );
  }
}
