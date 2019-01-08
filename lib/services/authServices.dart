import './httpServices.dart';
// import 'package:shared_preferences/shared_preferences.dart';

login(email, password, success, fail) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  var response;
  final route = 'ba/login';
  final params = {
    "client_id": 2,
		"client_secret": 'aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM',
		"nric": email,
		"ref_no": password,
  };

  await httpRequest(route, params, "POST", success, fail);
}