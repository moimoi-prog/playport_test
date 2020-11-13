import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:state_notifier/state_notifier.dart';

import 'CommentData.dart';
import 'ShoutDetailPageState.dart';


class ShoutDetailPageNotifier extends StateNotifier<ShoutDetailPageState> with LocatorMixin {
  ShoutDetailPageNotifier() : super(const ShoutDetailPageState.loading());

  // 初期化
  @override
  void initState() async {
    super.initState();

    state = ShoutDetailPageState(comments: []);
  }

  // コメントを取得する
  Future<bool> setCommentDatas(String postId) async {
    final currentState = state;

    List<DocumentSnapshot> queries = (await FirebaseFirestore.instance
        .collection(Strings.COMMENTS)
        .where(Strings.POSTID, isEqualTo: postId)
        .orderBy(Strings.TIMESTAMP, descending: true)
        .get()).docs;

    List<CommentData> comments = [];

    for (DocumentSnapshot doc in queries) {
      String image;
      String uid;
      String name;

      DocumentSnapshot user = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.data()[Strings.UID]).get();

      image = user.data()[Strings.PROFILE_IMAGE_PATH];
      uid = user.id;
      name = user.data()[Strings.NAME];

      CommentData comment = CommentData();

      comment.image = image;
      comment.uid = uid;
      comment.name = name;
      comment.date = doc.data()[Strings.TIMESTAMP].toDate();
      comment.content = doc.data()[Strings.SENTENCE];

      comments.add(comment);
    }


    if (currentState is ShoutDetailPageStateData) {
      state = currentState.copyWith(comments: comments);
    } else {
      state = ShoutDetailPageState(comments: comments);
    }


    return true;
  }

  Future<void> reload(String postId) async {
    final currentState = state;

    List<DocumentSnapshot> queries = (await FirebaseFirestore.instance
        .collection(Strings.COMMENTS)
        .where(Strings.POSTID, isEqualTo: postId)
        .orderBy(Strings.TIMESTAMP, descending: true)
        .get()).docs;

    List<CommentData> comments = [];

    for (DocumentSnapshot doc in queries) {
      String image;
      String uid;
      String name;

      DocumentSnapshot user = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.data()[Strings.UID]).get();

      image = user.data()[Strings.PROFILE_IMAGE_PATH];
      uid = user.id;
      name = user.data()[Strings.NAME];

      CommentData comment = CommentData();

      comment.image = image;
      comment.uid = uid;
      comment.name = name;
      comment.date = doc.data()[Strings.TIMESTAMP].toDate();
      comment.content = doc.data()[Strings.SENTENCE];

      comments.add(comment);
    }


    if (currentState is ShoutDetailPageStateData) {
      state = currentState.copyWith(comments: comments);
    } else {
      state = ShoutDetailPageState(comments: comments);
    }


    return true;
  }

  // 内容をリセットする
  void reset() {
    final currentState = state;

    if (currentState is ShoutDetailPageStateData) {
      state = currentState.copyWith(comments: []);
    } else {
      state = ShoutDetailPageState(comments: []);
    }
  }
}
