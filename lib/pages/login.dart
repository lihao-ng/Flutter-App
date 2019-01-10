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
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var email, password;

  _onSubmit() async {
    print('pressed');
    email = emailController.text;
    password = passwordController.text;
    
    await login(email, password, (success) {
      if(success.statusCode == 200) {
        print('success');
        user = Auth.fromJson(success.data);
        storeTokens(user);
        // go to home page
      }
    }, (fail) {
      print('fail');
      print(fail);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    TextStyle inputStyle = new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.redAccent);
    var assetsImage = new AssetImage('assets/solar_system.png');
 
    return new MaterialApp(
      theme: Theme.of(context).copyWith(hintColor: Colors.red),
      home: new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text("Login"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Container(
          padding: EdgeInsets.all(15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.only(bottom: 30.0),
                child: new Image(
                  image: assetsImage, 
                  width: 80.0, 
                  height: 80.0
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
                ),
                child: new TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'example@gmail.com',
                    labelStyle: inputStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
                ),
                child: new TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'secret',
                    labelStyle: inputStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
                ),
                child: new SizedBox(
                  width: double.infinity,
                  child: new RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("LOGIN"),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0)),
                    onPressed: () {
                      _onSubmit();
                    }
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}