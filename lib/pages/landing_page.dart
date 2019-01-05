import 'package:flutter/material.dart';
import './../models/Photo.dart';
import './../lists/photoLists.dart';
import './single_photo.dart';
import 'package:dio/dio.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  var _isLoading = true;
  List<Photo> photos;
  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  _fetchData() async {
    // final url = "http://192.168.1.156/api/v1";
    // var type = "POST";
    

    // if (response.statusCode == 200) {
      // photos = (json.decode(response.body) as List)
      //     .map((data) => new Photo.fromJson(data))
      //     .toList();

      // setState(() {
      //   _isLoading = false;
      // });
    // }
    var baseUrl = "https://jsonplaceholder.typicode.com/photos";
    var type = "GET";
  // final response = await http.get(apiUrl);
  var dio = new Dio(new Options(
    method: type,
    headers: {
      "client-id": "2",
      "client-secret": "aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM"
    },
    // contentType: ContentType.json,
    responseType: ResponseType.JSON
  ));
  Future<Response> response = await dio.request(baseUrl, options: dio.options)
  .then((result) {
    print(result.statusCode);
    print(result.data);
    
      photos = (result.data as List)
          .map((data) => new Photo.fromJson(data))
          .toList();

      setState(() {
        _isLoading = false;
      });
  }, onError: (err) {
    print(err.response.statusCode);
  });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Flutter App"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {  
              setState(() {
                _isLoading = true;
              });
              _fetchData();
            },
          ),
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.photos != null ? this.photos.length : 0,
                itemBuilder: (context, i) {
                  var photo = this.photos[i];
              
                  return new FlatButton(
                    child: new PhotoLists(photo),
                    onPressed: () {
                      Navigator.push(context,
                       new MaterialPageRoute(
                         builder: (context) => SinglePhoto(photo: photo),
                       )
                      );
                    },
                  );
                }
            ),
      ),
    ));
  }
}
