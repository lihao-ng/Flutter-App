// import 'dart:_http';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://192.168.1.156/api/v1';

httpRequest(route, params, type) async {
	var apiUrl = baseUrl + route;

  // final response = await http.get(apiUrl);
  
  var dio = new Dio(new Options(
    baseUrl: apiUrl,
    method: type,
    headers: {

    },
    // contentType: ContentType.json,
    responseType: ResponseType.JSON
  ));

  Response<String> response;

  response = await dio.post("/ba/login");
  print(response.data);

  // if(response.statusCode == 200) {
  //     photos = (json.decode(response.body) as List)
  //         .map((data) => new Photo.fromJson(data))
  //         .toList();

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }

	// axios({
	// 	method: type,
	// 	url: apiUrl,
	// 	data: params,
	// 	headers: {
	// 		'client-id': 2,
	// 		'client-secret': 'aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM'
	// 	}
	// }).then((response) => {
	// 	console.log(response, 'result');
	// 	success(response);
	// })
	// .catch((error) => {
	// 	console.log(error, 'error');
	// 	fail(error.response);
	// });
}