import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/firebase/FirebaseModule.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ----------------------------------
// クラス名　: SplashPage
// 処理概要　: スプラッシュ画面
// ----------------------------------
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初期設定
    initializeFirebase().then( // Firebase関連のやつをインスタンス化
            (_) => user == null
                ? Navigator.pushReplacementNamed(context, "/login") // userを取得できなかった場合
                : Navigator.pushReplacementNamed(context, "/main") // userを取得できた場合
    );

    // 処理中画面
    return Scaffold(
      body: Center(
        child: Text("データ読み込み中")
      )
    );
  }
}
