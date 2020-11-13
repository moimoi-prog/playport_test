import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/state/shoutListTab/ShoutListNotifier.dart';
import 'package:provider/provider.dart';


// ----------------------------------
// クラス名　: PostAddPage
// 処理概要　: シャウト追加ページ
// ----------------------------------
class ShoutAddPage extends StatelessWidget {
  final DocumentSnapshot document;

  ShoutAddPage({Key key, this.document}) : super(key: key);

  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController _shoutController;

    if (document != null) {
      _shoutController = TextEditingController(text: document.data()[Strings.DETAIL]);
    } else {
      _shoutController = TextEditingController(text: "");
    }

    // 処理中画面
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("シャウトする"),
          ),
          body: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        Container(
                            child: Expanded(
                                child: TextFormField(
                          // decoration: InputDecoration(labelText: ""),
                          controller: _shoutController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          // ignore: missing_return
                          validator: (value) {
                            if (value == null || value == "") {
                              return "入力してください";
                            }
                          },
                        ))),
                        // ここにはタグの一覧を表示する
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // 写真を撮影
                            IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {
                                Fluttertoast.showToast(msg: "カメラを使用して画像を撮影しました。");
                              },
                            ),
                            // ライブラリから選択
                            IconButton(
                              icon: Icon(Icons.photo_library),
                              onPressed: () {
                                Fluttertoast.showToast(msg: "ライブラリから画像を選択しました。");
                              },
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "タグをつける"),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  if (document == null) {
                                    await createNewPost(_shoutController.text);
                                  } else {
                                    await createNewPost(_shoutController.text, postId: document.id);
                                  }
                                  Provider.of<ShoutListNotifier>(context, listen: false).reloadShouts();
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(msg: "シャウトを送信しました。");
                                }
                              },
                            )
                          ],
                        )
                      ])))),
    );
  }
}
