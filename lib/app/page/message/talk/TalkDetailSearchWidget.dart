import 'package:flutter/material.dart';

class TalkDetailSearchWidget extends StatelessWidget {
  final String hintText;

  const TalkDetailSearchWidget({Key key, this.hintText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(hintText: hintText == null ? "トーク内容を検索" : hintText),
      ),
    );
  }
}
