import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/main/matching/AutoMatchingTalkPage.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/AutosModule.dart';

class AutoMatchingTab extends StatefulWidget {
  @override
  _AutoMatchingTabState createState() => _AutoMatchingTabState();
}

class _AutoMatchingTabState extends State<AutoMatchingTab> {
  Map<String, List<String>> _dropDownMenu = {
    'ゲームを選択してください': ["目的を選択してください"],
    'ポケモン剣盾': ['対戦', '交換', '雑談'],
    'あつまれどうぶつの森': ['島へ遊びに行く/来てもらう', '雑談'],
  };

  String _selectKey = "ゲームを選択してください";
  String _selectItem = "目的を選択してください";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("オートマッチング")
        ),
          body: Center(
              child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: _selectKey,
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (newValue) {
                setState(() {
                  _selectKey = newValue;
                  _selectItem = _dropDownMenu[_selectKey][0];
                });
              },
              items: _dropDownMenu.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(value, overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text("目的を選択"),
              value: _selectItem,
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (newValue) {
                setState(() {
                  _selectItem = newValue;
                });
              },
              items: _dropDownMenu[_selectKey].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(value, overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
            ),
            RaisedButton(
                child: Text("マッチング"),
                color: Theme.of(context).backgroundColor,
                shape: StadiumBorder(),
                onPressed: () async {
                  // オートマッチング用ルームを生成
                  String roomId = await registerAutos(_selectKey, _selectItem);

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return AutoMatchingTalkPage(id: roomId);
                  }));
                })
          ],
        ),
      ))),
    );
  }
}
