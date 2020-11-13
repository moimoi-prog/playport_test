import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Strings.dart';

// ユーザープロフィール画像
class UserImageWidget extends StatelessWidget {
  /* ユーザーID    　*/ final String uid;

  /* 半径         　*/
  final double radius;

  /* 存在しない場合 　*/
  final Color color;

  /* プロフィール遷移 */
  final bool profile;

  const UserImageWidget({Key key, this.uid, this.radius, this.color, this.profile = false})
      :
        assert(uid != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          // データ取得中に表示
          if (!doc.hasData) {
            return Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                )
            );
          }

          // データが存在しなかったときの処理
          if (!doc.data.data().containsKey(Strings.PROFILE_IMAGE_PATH)) {
            return InkWell(
              onTap: () {
                if (profile) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage(uid: doc.data.data()[Strings.UID]);
                      },
                    ),
                  );
                }
              },
              child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  )
              )
            );
          }

          Image image = Image.network(doc.data.data()[Strings.PROFILE_IMAGE_PATH]);

          // データを表示
          return InkWell(
            onTap: () {
              if (profile) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(uid: doc.data.data()[Strings.UID]);
                    },
                  ),
                );
              }
            },
            child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            doc.data.data()[Strings.PROFILE_IMAGE_PATH]
                        )
                    )
                )
            ),
          );
        });
  }
}

// ユーザープロフィール画像
class UserImageWidgetFromPath extends StatelessWidget {
  /* ユーザーID    　*/ final String path;
  /* 半径         　*/ final double radius;
  /* 存在しない場合 　*/ final Color color;

  const UserImageWidgetFromPath({ // コンストラクタ
    Key key,
    this.path,
    this.radius,
    this.color}):
        assert(path != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // データが存在しなかったときの処理
    if (path == "" || path == null) {
      return Container( // 指定された色の丸い画像を返す
        width: MediaQuery.of(context).size.width / 8,
        height: MediaQuery.of(context).size.width / 8,
        color: color,
      );
    }

    return Container( // 画像を返す
          width: MediaQuery.of(context).size.width / 8,
          height: MediaQuery.of(context).size.width / 8,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      path
                  )
              )
          )
      );
  }
}

// グループ明細画像
class GroupDetailImageWidget extends StatelessWidget {
  final String path;
  final double radius;
  final Color color;

  const GroupDetailImageWidget({Key key, this.path, this.radius, this.color})
      :
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return Container(
        width: radius,
        height: radius,
        color: color,
      );
    }

    // データを表示
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(path)
            )
        )
    );
  }
}

// グループイメージ画像
class GroupImageWidget extends StatelessWidget {
  final String path;
  final double radius;
  final Color color;

  const GroupImageWidget({Key key, this.path, this.radius, this.color})
      :
        assert(path != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // データ取得中に表示
    if (path == "") {
      return Container(
        width: radius,
        height: radius,
        color: color,
      );
    }
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: FileImage(File(path))
            )
        )
    );
  }
}

// コミュニティ画像
class CommunityImageWidget extends StatelessWidget {
  final String id;
  final double radius;
  final Color color;

  const CommunityImageWidget({Key key, this.id, this.radius, this.color})
      :
        assert(id != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Strings.ROOMS).doc(id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          // データ取得中に表示
          if (!doc.hasData) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 8,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                )
            );
          }

          // データが存在しなかったときの処理
          if (!doc.data.data().containsKey(Strings.IMAGE_PATH)) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 8,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                )
            );
          }

          // データを表示
          return Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          doc.data.data()[Strings.IMAGE_PATH]
                      )
                  )
              )
          );
        });
  }
}

