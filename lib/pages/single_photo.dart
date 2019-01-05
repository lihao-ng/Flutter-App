import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './../models/Photo.dart';

class SinglePhoto extends StatefulWidget {
  final Photo photo;

  SinglePhoto({this.photo});

  @override
  State<StatefulWidget> createState() {
    return new SinglePhotoState();
  }
}

class SinglePhotoState extends State<SinglePhoto> {
  var _isLoading = true;
  Photo photo;

  @override
  void initState() {
    super.initState();
    _fetchSinglePhoto(widget.photo.toStringId());
  }

  _fetchSinglePhoto(id) async {
    final url = "https://jsonplaceholder.typicode.com/photos/" + id;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var photoJson = json.decode(response.body);
      this.photo = Photo.fromJson(photoJson);
 
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar:
          new AppBar(centerTitle: true, title: new Text(widget.photo.title)),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new SinglePhotoDetail(photo: this.photo),
      ),
    ));
  }
}

class SinglePhotoDetail extends StatelessWidget {
  final Photo photo;

  SinglePhotoDetail({this.photo});

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.network(
          this.photo.image
        ),
        new Text(this.photo.title)
      ],
    );
  }
}
