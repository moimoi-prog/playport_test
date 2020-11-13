import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

class InfoDetailWidget extends StatelessWidget {
  final DocumentSnapshot document;

  InfoDetailWidget({Key key, this.document}): assert(document != null),super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(document.data()[Strings.CONTENT]);
  }
}
