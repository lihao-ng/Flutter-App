import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> with AfterLayoutMixin<SplashPage> {
  var accessToken;

  _getIntances(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // accessToken = prefs.getString('access_token');
  accessToken = null;
    if(accessToken == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    }else {
      // make request to check if still valid
      Navigator.of(context).pushReplacementNamed('/landingPage');
    }
  }
    
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          body: new Container(
          child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                      "Flutter",
                      style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: new CircularProgressIndicator()
                  )
                ],
              )
            )
          )
        )
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      _getIntances(context);
    });
  }
}