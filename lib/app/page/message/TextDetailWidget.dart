import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';

class TextDetailWidget extends StatelessWidget {
  final DocumentSnapshot document;

  TextDetailWidget({Key key, this.document}): assert(document != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;

    return InkWell(
      onLongPress: () {
        Fluttertoast.showToast(msg: "メッセージを編集");
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
        ),
        child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(2.0),
            // color: Colors.black,
            // width: width,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Text(
              document.data()[Strings.CONTENT],
            )),
      ),
    );
  }
}
