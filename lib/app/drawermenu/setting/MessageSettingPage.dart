import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/fixed/FixedEditPage.dart';
import 'package:playport_test/app/page/message/fixed/FixedRegisterPage.dart';


class MessageSettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("メッセージ設定"),
        ),
        body:     SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  title: Text('定型文を追加'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FixedRegisterPage();
                        },
                      ),
                    );
                  }),
              ListTile(
                  title: Text('定型文を編集'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FixedEditPage();
                        },
                      ),
                    );
                  }),
              ListTile(
                  title: Text('戻る'),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        )
    );
  }
}