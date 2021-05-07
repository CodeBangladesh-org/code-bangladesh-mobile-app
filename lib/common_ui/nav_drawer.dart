import 'package:code_bangladesh_mobile_app/app_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawerBuilder {
  static final Color _itemColor = Colors.blueAccent;
  static final String _discordLink = "https://discord.gg/RsCDspZKqM";
  static final String _githubLink = "https://github.com/CodeBangladesh-org";
  static final String _webVersionLink = "http://codebangladesh.org";
  static final String _aboutUsLink = "https://codebangladesh.org/about";

  static Drawer buildNavDrawer(BuildContext context) {
    return new Drawer(
        child: Container(color: Colors.white, child: ListView(children: _prepareNavDrawerItems(context))));
  }

  static List<Widget> _prepareNavDrawerItems(BuildContext context) {
    return [
      _navDrawerHeader(),
      SizedBox(height: 15.0),
      _buildNavLinkItem(context, FontAwesomeIcons.discord, "পরামর্শ দিন (Discord)", _discordLink),
      _buildNavLinkItem(context, FontAwesomeIcons.githubAlt, "গিটহাব", _githubLink),
      _buildNavLinkItem(context, FontAwesomeIcons.globe, "ওয়েব ভার্সন", _webVersionLink),
      _buildNavLinkItem(context, FontAwesomeIcons.info, "আমাদের কথা", _aboutUsLink),
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
        onTap: () {
          _sendNavLinkClickedAnalyticsEvent(context, text, link);
          return launch(link);
        },
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
      icon: new Icon(FontAwesomeIcons.info, color: _itemColor, size: 25),
    );
  }

  static Future<void> _sendNavLinkClickedAnalyticsEvent(BuildContext context, String text, String link) async {
    FirebaseAnalytics analytics = Provider.of<FirebaseAnalytics>(context, listen: false);
    analytics.setCurrentScreen(screenName: 'NavbarScreen');
    await analytics.logEvent(
      name: 'NavLinkClicked',
      parameters: <String, dynamic>{'text': text, 'link': link},
    );
  }
}
