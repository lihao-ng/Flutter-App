import 'package:flutter/material.dart';
import './../services/prefServices.dart';
import './../services/authServices.dart';
import './../models/Auth.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  Auth user;
  _onSubmit() async {
    print('pressed');
    await login("111", "23", (success) {
      if(success.statusCode == 200) {
        print('hi');
        print(success.data);
      // user = Auth.fromJson(success.data);
      // storeTokens(user);
      }
    }, (fail) {
      // if(fail.response.statusCode == 405) {
        
      // }
      print('hi fail');
      print(fail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
            child: new FlatButton(
          child: new Text("LOGIN"),
          onPressed: () {
            _onSubmit();
          },
        )),
      ),
    );
  }
}