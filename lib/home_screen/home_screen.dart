import 'package:code_bangladesh_mobile_app/utils/data_fetcher.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/common_ui/appbar_builder.dart';
import 'package:code_bangladesh_mobile_app/home_screen/home_screen_future_builder.dart';
import 'package:code_bangladesh_mobile_app/common_ui/nav_drawer.dart';
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
      appBar: AppBarBuilder.buildAppBar(context),
      drawer: NavDrawerBuilder.buildNavDrawer(context),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade100),
        child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Center(
              child: HomeScreenFutureBuilder.buildFutureBuilder(appDataFuture),
            )),
      ),
    );
  }
}
