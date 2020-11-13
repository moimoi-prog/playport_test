import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/dialog/LoadingDialog.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------------
// ログインページ
// ------------------------------------
class AccountRegisterPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController(text: "");
  final TextEditingController _passController = TextEditingController(text: "");
  final TextEditingController _passReController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("アカウント登録"),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _mailController,
                        decoration: InputDecoration(hintText: "メールアドレス"),
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "メールアドレスは必須です。";
                          }
                        },
                      ),
                      TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(hintText: "パスワード"),
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "パスワードは必須です。";
                          }
                        },
                      ),
                      TextFormField(
                        controller: _passReController,
                        decoration: InputDecoration(hintText: "パスワード再入力"),
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value == "") {
                            return "パスワード(再入力)は必須です。";
                          }
                        },
                      ),
                    ],
                  ),
                ),


                // 新規作成ボタン
                _registerButton(context),

              ],
            ),
          )),
    );
  }

  // 新規作成ボタン
  Widget _registerButton(BuildContext context) {
    return RaisedButton(
        child: Text("登録"),
        color: Theme.of(context).backgroundColor,
        shape: StadiumBorder(),
        onPressed: () async {
          Fluttertoast.showToast(msg: "登録");
        });
  }
}
