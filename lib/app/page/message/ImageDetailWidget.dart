import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

class ImageDetailWidget extends StatelessWidget {
  final DocumentSnapshot document;

  ImageDetailWidget({Key key, this.document}): assert(document != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img = Image.network(document.data()[Strings.CONTENT]);
    int imgWidht = document.data()[Strings.WIDTH];
    int imgHeight = document.data()[Strings.HEIGHT];
    double width = MediaQuery.of(context).size.width / 2;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        child: img,
        width: width,
        height: imgHeight / imgWidht * width,
      ),
    );
  }
}
