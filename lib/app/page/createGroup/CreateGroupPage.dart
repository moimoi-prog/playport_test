import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/main/message/group/GroupImageBottmnSheet.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/app/widget/UserNameWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/GroupModule.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupNotifier.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupState.dart';
import 'package:playport_test/state/createGroupPage/Friend.dart';
import 'package:provider/provider.dart';

// ------------------------------------
// グループ作成ページ
// ------------------------------------
class CreateGroupPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("グループを作成する"),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // グループイメージ
                  MaterialButton(
                    onPressed: () {
                      showGroupImageBottmnSheet(context);
                    },
                    child: ClipOval(
                      child: Provider.of<CreateGroupState>(context, listen: true).when(
                              (imagePath, groupNameController, selectedFriends, friends) {
                        return GroupImageWidget(path: imagePath, radius: width / 3, color: Colors.grey);
                      }, loading: () {
                        return GroupImageWidget(path: "", radius: width / 3, color: Colors.grey);
                      }),
                    ),
                  ),

                  // グループ名
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: Provider.of<CreateGroupState>(context, listen: true).when(
                                  (imagePath, groupNameController, selectedFriends, friends) {
                            return groupNameController;
                          }, loading: () {
                            return null;
                          }),
                          decoration: InputDecoration(labelText: "グループ名"),
                          // ignore: missing_return
                          validator: (value) {
                            if (value == null || value == "") {
                              return "グループ名は必須です。";
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  // 選択一覧
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Provider.of<CreateGroupState>(context, listen: true).when(
                            (imagePath, groupNameController, selectedFriends, friends) {
                          if (selectedFriends.length > 0) {
                            return Row(
                              children: selectedFriends.map((friend) {
                                return UserImageWidget(uid: friend, radius: width / 8, color: Colors.grey);
                              }).toList(),
                            );
                          }

                          return Text("フレンドを選択してください");
                        }, loading: () {
                      return Text("ユーザー情報を取得中・・・");
                    }),
                  ),

                  // フレンド一覧
                  Expanded(child: Provider.of<CreateGroupState>(context, listen: true).when(
                              (imagePath, groupNameController, selectedFriends, friends) {
                    return ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: friends.length,
                        itemBuilder: (context, index) {
                          Friend friend = friends[index];
                          return Card(
                            color: friend.completed ? Theme.of(context).backgroundColor : Theme.of(context).cardColor,
                            child: ListTile(
                              leading: UserImageWidget(uid: friend.uid, radius: width / 8, color: Colors.grey),
                              title: StreamBuilder(
                                stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(friend.uid).snapshots(),
                                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                                  if (!doc.hasData) {
                                    return Text("ユーザー名を取得中");
                                  }

                                  return Text(doc.data.data()[Strings.NAME]);
                                },
                              ),
                              onTap: () {
                                Provider.of<CreateGroupNotifier>(context, listen: false).check(friend);
                              },
                            ),
                          );
                        });
                  }, loading: () {
                    return Center(child: CircularProgressIndicator());
                  })),
                ],
              ),
            )),
        floatingActionButton: Provider.of<CreateGroupState>(context, listen: true).when(
                (imagePath, groupNameController, selectedFriends, friends) {
              return FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () async {
                  await registerGroup(imagePath, groupNameController.text, selectedFriends);
                  Navigator.of(context).pop();
                },
              );
            }, loading: () {
          return CircularProgressIndicator();
        })
      ),
    );
  }

  Widget _memberWidget(BuildContext context, String uid) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        UserImageWidget(uid: uid, radius: width / 8, color: Colors.grey),
        UserNameWidget(uid: uid),
      ],
    );
  }
}
