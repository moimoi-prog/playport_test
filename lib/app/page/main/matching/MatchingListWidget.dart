import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/main/matching/FriendButtons.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/enum/MatchingType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/state/userListTab/Matching.dart';

import '../../../widget/CircleImageWidget.dart';

// ------------------------------------
// ユーザーリスト明細パーツ
// ------------------------------------
class MatchingListWidget extends StatelessWidget {
  final Matching matching;

  const MatchingListWidget({Key key, this.matching}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProfilePage(uid: matching.uid);
            },
          ),
        );
      },
      child: ListTile(
          leading: Container(
              // ユーザー画像
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(matching.image)))),
          // title: Row(
          //   children: [
          //     Text(matching.name, style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
          //     Text("  " + matching.game, style: TextStyle(color: Colors.grey), overflow: TextOverflow.ellipsis,),
          //   ],
          // ),
          title: Text(matching.name, style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
          subtitle: Text(matching.introduction, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 5),
          trailing: _trailingButton(context, matching.status, matching.uid)),
    );
  }

  Widget _trailingButton(BuildContext context, MatchingType status, String uid) {
    switch (status) {
      case MatchingType.person:
        return Text("");
        break;

      case MatchingType.friend:
        return FriendButton(color: Theme.of(context).cardColor);
        break;

      case MatchingType.sending:
        return RequestButton(color: Theme.of(context).cardColor);
        break;

      case MatchingType.others:
        return SendButton(color: Theme.of(context).cardColor, uid: uid);
        break;
    }
  }
}
// DefaultTextStyle(style: TextStyle(), overflow: TextOverflow.ellipsis, maxLines: 3, child: Text(document.data()["introduction"])),
