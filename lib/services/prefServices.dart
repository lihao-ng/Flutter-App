import 'package:shared_preferences/shared_preferences.dart';
import './../models/Auth.dart';

storeTokens(Auth user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //encrpyt to base64 later
  await prefs.setString("access_token", user.accessToken);
  await prefs.setString("refresh_token", user.refreshToken);
  await prefs.setInt("user_id", user.id);
  await prefs.setString("user_id", user.ownerType);
}
