import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login.dart';
import './pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new Routes());
}

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.redAccent,
  accentColor: Colors.white
);

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _themeData,
      home: SplashPage(),
      routes: <String, WidgetBuilder> {
          '/login': (BuildContext context) => new Login(),
          '/landingPage': (BuildContext context) => new LandingPage()
      }
    );
  }
}