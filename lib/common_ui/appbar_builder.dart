import 'package:flutter/material.dart';

class AppBarBuilder {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: Text("CodeBangladesh.org"),
        backgroundColor: Colors.blue.shade200,
        elevation: 15,
        leading: Builder(
            builder: (context) => Navigator.canPop(context)
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  )));
  }
}
