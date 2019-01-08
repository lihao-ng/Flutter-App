import 'package:flutter/material.dart';
import './../models/Photo.dart';
import './../lists/photoLists.dart';
import './single_photo.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

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
  
    var baseUrl = 'http://192.168.1.156/api/v1/ba/login';
    var type = "POST";
  
    var dio = new Dio(new Options(
      method: type,
    headers: {
      "client-id": "2",
      "client-secret": "aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM"
    },
    data: {
      "nric" : "112",
      "ref_no": "23"
    },
    responseType: ResponseType.JSON
  ));

  var data;

  await dio.request(baseUrl, options: dio.options)
  .then((result) {
    data = result.data;
      // photos = (result.data as List)
      //     .map((data) => new Photo.fromJson(data))
      //     .toList();

      // setState(() {
      //   _isLoading = false;
      // });
      print(result.data);
  }, onError: (err) {
    print(err.response);
  });

print(data['message']);
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
