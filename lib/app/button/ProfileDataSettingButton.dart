import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/profileSeting/ProfileSettingPage.dart';

class ProfileDataSettingButton extends StatelessWidget {
  final String uid;

  const ProfileDataSettingButton({Key key, this.uid}) : assert(uid != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("編集"),
        color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfileSettingPage(uid: uid);
              },
            ),
          );        }
    );
  }
}