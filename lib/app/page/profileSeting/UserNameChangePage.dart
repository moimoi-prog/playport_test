import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

class UserNameChangePage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text("名前を変更"),
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
                            labelText: "名前を入力"
                        ),
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
                              await setName(_nameController.text);
                              Fluttertoast.showToast(msg: "名前を変更しました");
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
