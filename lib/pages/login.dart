import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  @override
 Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
            child: new FlatButton(
          child: new Text("LOGIN"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/landingPage');
          },
        )),
      ),
    );
  }
}