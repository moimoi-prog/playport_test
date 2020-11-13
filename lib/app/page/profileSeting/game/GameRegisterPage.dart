import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

class GameRegisterPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = new TextEditingController(text: "");
  final TextEditingController _typeController = new TextEditingController(text: "");
  final TextEditingController _messageController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
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
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: "ゲーム名を入力"
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "入力してください";
                          }
                        },
                      ),
                      TextFormField(
                        controller: _typeController,
                        decoration: InputDecoration(
                            labelText: "やり込み度を入力"
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "入力してください";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "メッセージを入力"),
                        controller: _messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "入力してください。";
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
                              await setGame(_nameController.text, _typeController.text, _messageController.text);
                              Fluttertoast.showToast(msg: "ゲームを登録しました");
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
