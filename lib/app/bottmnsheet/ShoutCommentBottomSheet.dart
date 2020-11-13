import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/CommentModule.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsNotifier.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsState.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageNotifier.dart';
import 'package:playport_test/state/shoutListTab/ShoutDetailState.dart';
import 'package:playport_test/state/shoutListTab/ShoutListNotifier.dart';
import 'package:provider/provider.dart';

// ---------------------------------------------------
// メソッド名: showShoutCommentBottomSheet
// 処理概要　: シャウトにするコメント
// ---------------------------------------------------
void showShoutCommentBottomSheet(BuildContext context, ShoutDetailState shout) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Container(
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "コメントを送信"),
                      controller: Provider.of<ScbsState>(context, listen: true).commentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        if (value != null && value != "") {
                          Provider.of<ScbsNotifier>(context, listen: false).change(true);
                        } else {
                          Provider.of<ScbsNotifier>(context, listen: false).change(false);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: !Provider.of<ScbsState>(context, listen: true).enabled
                        ? null
                        : () async {
                            await registerComment(
                                shout.id,
                                Provider.of<ScbsNotifier>(context, listen: false).getText()
                            );
                            Fluttertoast.showToast(msg: "コメントを送信しました");
                            Navigator.of(context).pop();
                            Provider.of<ShoutListNotifier>(context, listen: false).reloadShout(shout.id);

                    },
                  )
                ],
              ),
            )),
            ListTile(
                title: Text('キャンセル', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    },
  );
}
