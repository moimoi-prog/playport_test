import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/dialog/LoadingDialog.dart';
import 'package:playport_test/app/page/main/AccountRegisterPage.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------------
// ログインページ
// ------------------------------------
class LoginPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController(text: "");
  final TextEditingController _passController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("ログイン"),
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
                    ],
                  ),
                ),


                // メールログイン実行ボタン
                _mailLoginButton(context),

                // アカウント新規作成ボタン
                _moveAccountRegisterPageButton(context),

                // googleログイン用ボタン
                _googleLoginButton(context),

                // facebookログイン用ボタン
                _facebookLoginButton(context),

              ],
            ),
          )),
    );
  }

  // ログインボタン
  Widget _mailLoginButton(BuildContext context) {
    return RaisedButton(
        child: Text("ログイン"),
        color: Theme.of(context).backgroundColor,
        shape: StadiumBorder(),
        onPressed: () async {
          Fluttertoast.showToast(msg: "フレンド");
        });
  }

  // アカウント新規作成ボタン
  Widget _moveAccountRegisterPageButton(BuildContext context) {
    return FlatButton(
      child: Text("新規登録"),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return AccountRegisterPage();
            },
          ),
        );

        Fluttertoast.showToast(msg: "新規登録を行いました。");
      },
    );
  }


  // googleログイン用ボタン
  Widget _googleLoginButton(BuildContext context) {
    return FlatButton(
        child: Text(
          "Googleでサインイン",
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.grey,
          ),
        ),
        onPressed: () async {
          showLoadingDialog(context);
          await signInWithGoogle();
          Navigator.of(context).pop();

          if (user != null) {
            Navigator.pushReplacementNamed(context, "/main");
          }
        });
  }

  // facebookログイン用ボタン
  Widget _facebookLoginButton(BuildContext context) {
    return FlatButton(
        child: Text(
          "facebookでサインイン",
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.grey,
          ),
        ),
        onPressed: () async {
          showLoadingDialog(context);
          await signInWithGoogle();
          Navigator.of(context).pop();

          if (user != null) {
            Fluttertoast.showToast(msg: "ログインに成功しました。");
            Navigator.pushReplacementNamed(context, "/main");
          }
        });
  }
}
