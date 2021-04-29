import 'package:flutter/material.dart';

class HomeScreenAppBar {
  static AppBar buildAppBar() {
    return new AppBar(
      title: new Text(""),
      backgroundColor: Colors.blue.shade200,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.autorenew_sharp,
                size: 26.0,
              ),
            )),
      ],
    );
  }
}
