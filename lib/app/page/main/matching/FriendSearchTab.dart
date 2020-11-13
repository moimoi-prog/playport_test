import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

class FriendSearchTab extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // テキストボックスコントローラー
  TextEditingController _friendCodeController = TextEditingController(text: "qSfN2LoWfHgFsQKC2K9a0PigVv03");


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(2.0),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)
                        )
                    ),
                    child: TextFormField(
                      controller: _friendCodeController,
                      decoration: InputDecoration(hintText: "フレンドコードを入力"),
                      // ignore: missing_return
                      validator: (value)  {
                        if (user.uid == value) {
                          return "自分は指定できません";
                        }

                        if (value == null || value == "") {
                          return "入力してください";
                        }
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text("検索"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        DocumentSnapshot doc = await getUser(_friendCodeController.text);
                        if (doc != null) {
                          bool result = await sendFriendRequest(user.uid, doc.data()[Strings.UID]);
                          if (result) {
                            Fluttertoast.showToast(msg: "フレンド申請を送信しました。");
                          }
                        } else {
                          Fluttertoast.showToast(msg: "ユーザー情報が存在しませんでした。");
                        }
                      }
                    },
                  )
                ],
              ),
            )
          ),
        ),
    );
  }
}
