import 'package:code_bangladesh_mobile_app/app_router.dart';
import 'package:flutter/material.dart';

class NavDrawer {
  static final Color _itemColor = Colors.blueAccent;

  static Drawer getNavDrawer(BuildContext context) {
    return new Drawer(
        child: Container(color: Colors.white, child: ListView(children: _prepareNavDrawerItems(context))));
  }

  static List<Widget> _prepareNavDrawerItems(BuildContext context) {
    return [
      _navDrawerHeader(),
      SizedBox(height: 15.0),
      _buildNavItem(context, Icons.home, "প্রচ্ছদ", AppRouter.homeScreenRoute),
      _buildNavItem(context, Icons.home, "আমাদের কথা", AppRouter.aboutUsScreenRoute),
      _navDrawerAppInfo()
    ];
  }

  static DrawerHeader _navDrawerHeader() {
    return new DrawerHeader(
      child: Container(
        padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
        child: new OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          child: Image.asset("assets/img/tortoise.png", fit: BoxFit.contain),
        ),
      ),
    );
  }

  static ListTile _buildNavItem(BuildContext context, icon, String text, String routeName) {
    return ListTile(
        leading: Icon(icon, color: _itemColor, size: 30),
        title: Text(
          text,
          style: TextStyle(color: _itemColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onTap: () {
          () => Navigator.of(context).pop();
          Navigator.of(context).pushNamed(routeName);
        },
        horizontalTitleGap: 0);
  }

  static AboutListTile _navDrawerAppInfo() {
    return new AboutListTile(
      child: Transform.translate(
          offset: Offset(-16, 0),
          child: new Text(
            "অ্যাপ ইনফো",
            style: TextStyle(color: _itemColor, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      applicationName: "CodeBangladesh.org",
      applicationVersion: "v1.0.0",
      applicationIcon: new Icon(Icons.adb),
      dense: true,
      icon: new Icon(Icons.info, color: _itemColor, size: 30),
    );
  }
}
