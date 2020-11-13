import 'package:flutter/material.dart';

Widget roomImageWidget() {
  return GestureDetector(
    child: Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 100.0,
        ),
        Icon(Icons.camera_alt)
      ],
    ),
  );
}