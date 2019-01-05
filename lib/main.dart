import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login.dart';
import './pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new Routes());
}

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: SplashPage(),
      routes: <String, WidgetBuilder> {
          '/login': (BuildContext context) => new Login(),
          '/landingPage': (BuildContext context) => new LandingPage()
      }
    );
  }

}
// class SplashPageState extends State<SplashPage> {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: new Scaffold(
//         appBar: AppBar(
//           title: new Text("Fluuter"),
//         ),
//       body: SplashPage(),
//       )
//     );
//     var accessToken;

// _getIntances(BuildContext context) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   accessToken = prefs.getInt('access_token');
//   print(accessToken);

//   if(accessToken == null) {
//     Navigator.of(context).pushReplacementNamed('/login');
//     Navigator.popAndPushNamed(context, '/login');
//     // Navigator.push(context, )
//   }else {
//     // make request to check if token is still valid
//   }
// }

// return new MaterialApp(
//   home: new Scaffold(
//       appBar: new AppBar(centerTitle: true, title: new Text("Flutter App")),
//       body: new Container(
//           child: new Center(
//               child: new Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new Text(
//                       "Flutter",
//                       style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
//                     ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 10.0),
//                     child: new CircularProgressIndicator()
//                   )
//                 ],
//               )
//             )
//           )
//         ),
//   routes: <String, WidgetBuilder> {
//     '/login': (BuildContext context) => new Login()
//   }
// );
// }
// }
