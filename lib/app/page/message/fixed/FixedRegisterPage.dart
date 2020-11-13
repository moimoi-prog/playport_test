import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';


class FixedRegisterPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _messageController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text("定型文を登録"),
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
                          child: Text("登録"),
                          color: Theme.of(context).primaryColor,
                          shape: StadiumBorder(),
                          onPressed: () async {
                            // 記事リスト画面を表示
                            if (_formKey.currentState.validate()) {
                              await setFixed(_messageController.text);
                              Fluttertoast.showToast(msg: "定型文を登録しました");
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
