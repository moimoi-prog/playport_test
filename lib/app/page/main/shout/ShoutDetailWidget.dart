import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/bottmnsheet/ShoutCommentBottomSheet.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/module/CommonModule.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsNotifier.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageNotifier.dart';
import 'package:playport_test/state/shoutListTab/ShoutDetailState.dart';
import 'package:provider/provider.dart';

import '../../../widget/CircleImageWidget.dart';
import 'ShoutDetailPage.dart';

// ------------------------------------
// 記事明細パーツ
// ------------------------------------
class ShoutDetailWidget extends StatelessWidget {
  /* shoutデータ */ final ShoutDetailState shout;

  const ShoutDetailWidget({Key key, this.shout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: ListTile(
        leading: InkWell(
          onTap: () {
            return Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(uid: shout.uid);
                    }
                )
            );
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          shout.userImagePath
                      )
                  )
              )
          ),
        ),
        // trailing: (document.data()[Strings.UID] == user.uid) ?  PostPopupMenu(document: document) : Text(""),
        title: InkWell(
            onTap: () {
              Provider.of<ScbsNotifier>(context, listen: false).reset();
              Provider.of<ShoutDetailPageNotifier>(context, listen: false).reset();
              Provider.of<ShoutDetailPageNotifier>(context, listen: false).setCommentDatas(shout.id);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ShoutDetailPage(shout: shout, width: width);
                  },
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(shout.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(getFormattedDate("yyyy/MM/dd", shout.shoutTimeStamp), style: TextStyle(color: Colors.grey)),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.star_border, color: Colors.grey),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
        subtitle: InkWell(
            onTap: () {
              Provider.of<ScbsNotifier>(context, listen: false).reset();
              Provider.of<ShoutDetailPageNotifier>(context, listen: false).reset();
              Provider.of<ShoutDetailPageNotifier>(context, listen: false).setCommentDatas(shout.id);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ShoutDetailPage(shout: shout, width: width);
                  },
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                  child: Text(
                      shout.shoutDetail,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color
                      )
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<ScbsNotifier>(context, listen: false).reset();
                    showShoutCommentBottomSheet(context, shout);
                  },
                  child: Row(
                    children: <Widget>[
                      shout.shoutComments > 0
                          ? Text("コメントする (+" + shout.shoutComments.toString() + "件)", style: TextStyle(color: Colors.grey))
                          : Text("コメントする", style: TextStyle(color: Colors.grey))

                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
