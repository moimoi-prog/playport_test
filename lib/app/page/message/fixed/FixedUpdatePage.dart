import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';


class FixedUpdatePage extends StatelessWidget {
  final DocumentSnapshot document;

  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FixedUpdatePage({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _messageController = new TextEditingController(text: document.data()["message"]);

    return
      Scaffold(
          appBar: AppBar(
            title: Text("ゲームを登録"),
          ),
          body: SafeArea(
            child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(labelText: "定型文を入力"),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "入力してください";
                          }
                        },
                      ),
                      RaisedButton(
                          child: Text("確定"),
                          color: Theme.of(context).primaryColor,
                          shape: StadiumBorder(),
                          onPressed: () async {
                            // 記事リスト画面を表示
                            if (_formKey.currentState.validate()) {
                              await updateFixed(document.id,  _messageController.text);
                              Fluttertoast.showToast(msg: "ゲームを編集しました");
                              Navigator.of(context).pop();
                            }
                          }),
                    ],
                  ),
                )),
          )
      );
  }
}
