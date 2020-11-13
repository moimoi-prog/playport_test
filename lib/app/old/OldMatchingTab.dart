import 'package:flutter/material.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/app/widget/PickGroupImageWidget.dart';
import 'package:playport_test/app/widget/RoomImageWidget.dart';
import 'package:playport_test/app/page/main/matching/AutoMatchingTab.dart';
import 'package:playport_test/app/page/main/matching/FriendSearchTab.dart';

class OldMatchingTab extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("マッチング"),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                      child: roomImageWidget(),
                      onPressed: () async {
                        String path = await pickGroupImage(context);
                      }),
                  TextFormField(
                    controller: _nameController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value == "") {
                        return "タイトルは必須です。";
                      }
                    },
                  ),
                  RaisedButton(
                      child: Text("ルームを登録"),
                      color: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        // 記事リスト画面を表示
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // String roomId = await createNewRoom(_nameController.text, user.uid);
                        }
                      }),
                  RaisedButton(
                      child: Text("フレンドコード"),
                      color: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return FriendSearchTab();
                            },
                          ),
                        );                      }),
                  RaisedButton(
                      child: Text("オートマッチング"),
                      color: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AutoMatchingTab();
                            },
                          ),
                        );                      })
                ],
              ),
            )),
          ),
      ),
    );
  }
}
