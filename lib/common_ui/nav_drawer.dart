import 'package:code_bangladesh_mobile_app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawerBuilder {
  static final Color _itemColor = Colors.blueAccent;
  static String discordLink;

  static Drawer buildNavDrawer(BuildContext context) {
    return new Drawer(
        child: Container(color: Colors.white, child: ListView(children: _prepareNavDrawerItems(context))));
  }

  static List<Widget> _prepareNavDrawerItems(BuildContext context) {
    return [
      _navDrawerHeader(),
      SizedBox(height: 15.0),
      _buildNavRouteItem(context, Icons.home, "প্রচ্ছদ", AppRouter.homeScreenRoute),
      _buildNavLinkItem(context, Icons.disc_full, "পরামর্শ দিন (Discord)", discordLink),
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

  static ListTile _buildNavRouteItem(BuildContext context, icon, String text, String routeName) {
    return ListTile(
        leading: Icon(icon, color: _itemColor, size: 25),
        title: Text(
          text,
          style: TextStyle(color: _itemColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () {
          () => Navigator.of(context).pop();
          Navigator.of(context).pushNamed(routeName);
        },
        horizontalTitleGap: 0);
  }

  static ListTile _buildNavLinkItem(BuildContext context, icon, String text, String link) {
    return ListTile(
        leading: Icon(icon, color: _itemColor, size: 25),
        title: Text(
          text,
          style: TextStyle(color: _itemColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () => launch(link),
        horizontalTitleGap: 0);
  }

  static AboutListTile _navDrawerAppInfo() {
    return new AboutListTile(
      child: Transform.translate(
          offset: Offset(-16, 0),
          child: new Text(
            "অ্যাপ ইনফো",
            style: TextStyle(color: _itemColor, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      applicationName: "CodeBangladesh.org",
      applicationVersion: "v1.0.0",
      applicationIcon: new Icon(Icons.adb, size: 25),
      dense: true,
      icon: new Icon(Icons.info, color: _itemColor, size: 25),
    );
  }
}
