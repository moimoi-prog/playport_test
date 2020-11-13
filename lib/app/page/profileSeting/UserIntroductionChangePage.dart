import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

class UserIntroductionChangePage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _introductionController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text("自己紹介を変更"),
          ),
          body: SafeArea(
            child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "自己紹介を入力"),
                        controller: _introductionController,
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
                              await setIntroduction(_introductionController.text);
                              Fluttertoast.showToast(msg: "自己紹介を変更しました");
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
