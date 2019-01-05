import 'package:flutter/material.dart';

class PhotoLists extends StatelessWidget {
  final photo;

  PhotoLists(this.photo);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Row(children: <Widget>[
        new Flexible(
          child: new Column(
            children: <Widget>[
              new Text(this.photo.title,
              overflow: TextOverflow.ellipsis,
              ),
              new Image.network(
              this.photo.image,
            )
            ],
          ),
        )
      ],),
    );
    // return new Card(
    //   child: Flexible(
    //     child: Column(
    //       children: <Widget>[
    //         new Text(
    //           this.photo.title,
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //         new Image.network(
    //           this.photo.image,
    //         )
    //       ],
    //     ),
    // ));

    // return new Column(
    //   children: <Widget>[
    //     new Container(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Container(
    //             color: Colors.blue,
    //             child: new Text(this.photo.title)
    //           ),
    //         ],
    //       ),
    // child: new Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     new Image.network(
    //       this.photo.image,
    //     ),
    //     new Container(height: 8.0),
    //     new Text(this.photo.title,
    //         style: new TextStyle(
    //             fontSize: 16.0, fontWeight: FontWeight.bold)),
    //   ],
    // ),

//         ),
//         new Divider()
//       ],
//     );
  }
}
