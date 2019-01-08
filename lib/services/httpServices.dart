import 'package:dio/dio.dart';
import './../models/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './prefServices.dart';

final baseUrl = 'http://192.168.1.154/api/v1/';

httpRequest(route, params, type, success, fail) async {
  var apiUrl = baseUrl + route;
  var response;

  var dio = new Dio(new Options(
      method: type,
      headers: {
        "client-id": "2",
        "client-secret": "aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM"
      },
      data: params,
      responseType: ResponseType.JSON));

  dio.interceptor.response.onError = (DioError err) async {
    if (err.response.statusCode == 405) {
      print("in erro interceptor");
      var response = await _refreshToken(err, dio);
      print(response);
      return response;
      // print(response.response.statusCode);
      // if(response.statusCode != null) {
      //   if(response.statusCode == 200) {
      //     return response;
      //   }
      // }else {
      //   return err;
      // }
    }

    return err;
  };
  print('request');
  await dio.request(apiUrl, options: dio.options)
  .then((result) {
    print(result);
    success(result);
  }, onError: (err) {
    // print(err);
    fail(err);
  });

  // return response;
}

_refreshToken(DioError err, Dio dio) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Auth user;
  Options dioOptions = err.response.request;
  final clientId = err.response.request.headers["client-id"];
  final clientSecret = err.response.request.headers["client-secret"];
  final refreshUrl = baseUrl + "refresh-token";
  var refreshToken = prefs.getString("refresh_token");
  var response;

  final params = {
    "grant_type": "refresh_token",
    "client_id": clientId,
    "client_secret": clientSecret,
    "refresh_token": refreshToken,
    "user_id": 2
  };

  final headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "client-id": clientId,
    "client-secret": clientSecret
  };

  var refreshDio = new Dio(new Options(
      method: "POST",
      headers: headers,
      data: params,
      responseType: ResponseType.JSON));

  await refreshDio.request(refreshUrl, options: refreshDio.options)
  .then((result) async {
    if(result.statusCode == 200) {
      print('in then refresh');
      user = Auth.fromJson(result.data);
      await storeTokens(user);
      dioOptions.headers["token-test"] = user.accessToken;
      response = await _reRequest(dioOptions);
    }
  }, onError: (err) {
    response = err;
    // clear token etc and log user out
  });

  return response;
}

_reRequest(Options dioOptions) async {
  var response;
  var reRequestDio = new Dio();
  print("in reRequest");
  // dioOptions.method = "GET";
  await reRequestDio.request("http://192.168.1.154/api/v1/products2", options: dioOptions)
    .then((onValue) {
      print(onValue);
      response = onValue;
    }, onError: (error) {
      print('error');
      response = error;
    });

  return response;
}
