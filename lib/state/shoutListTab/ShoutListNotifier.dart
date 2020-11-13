import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:state_notifier/state_notifier.dart';

import 'ShoutDetailState.dart';
import 'ShoutListState.dart';

class ShoutListNotifier extends StateNotifier<ShoutListState> with LocatorMixin {
  ShoutListNotifier() : super(const ShoutListState.loading());

  Query query;

  @override
  void initState() async {
    super.initState();

    this.query = FirebaseFirestore.instance // 投稿を取得(とりあえず50件)
        .collection(Strings.SHOUTS)
        .orderBy(Strings.TIMESTAMP, descending: true)
        .limit(50);

    List<DocumentSnapshot> shoutDocs = (await this.query.get()).docs;

    // 投稿リストを生成
    List<ShoutDetailState> shouts = [];

    // 投稿の詳細を取得
    for (DocumentSnapshot shoutDoc in shoutDocs) {
      String id; // 投稿ID
      String uid; // 投稿ユーザーID
      String userImagePath; // 投稿ユーザーイメージパス
      String userName; // 投稿ユーザー名
      String shoutDetail; // 投稿内容(文章)
      List<String> shoutImageList; // 投稿内容(画像)
      List<String> shoutMovieList; // 投稿内容(動画)
      List<String> shoutTagList; // 投稿タグ
      DateTime shoutTimeStamp;
      int shoutFavorite; // いいね数
      int shoutComments; // コメント数

      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 投稿ユーザー情報を取ってくる
          .collection(Strings.USERS)
          .doc(shoutDoc.data()[Strings.UID])
          .get();

      QuerySnapshot commentDocs = await FirebaseFirestore.instance // コメント情報を取ってくる
          .collection(Strings.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Strings.COMMENTS)
          .get();

      // 情報を設定
      id = shoutDoc.id;
      uid = userDoc.id;
      userImagePath = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
      userName = userDoc.data()[Strings.NAME];
      shoutDetail = shoutDoc.data()[Strings.DETAIL];
      shoutTimeStamp = shoutDoc.data()[Strings.TIMESTAMP].toDate();
      shoutFavorite = shoutDoc.data()[Strings.FAVORITE];
      shoutComments = commentDocs.size;

      // ↓この辺は後から
      shoutImageList = [];
      shoutMovieList = [];
      shoutTagList = [];

      // ShoutDetailStateインスタンスを生成
      ShoutDetailState shout = ShoutDetailState(id: id, uid: uid, userImagePath: userImagePath, userName: userName, shoutDetail: shoutDetail, shoutImageList: shoutImageList, shoutMovieList: shoutMovieList, shoutTagList: shoutTagList, shoutTimeStamp: shoutTimeStamp, shoutFavorite: shoutFavorite, shoutComments: shoutComments);

      // リストに格納する
      shouts.add(shout);
    }

    state = ShoutListState(
      shouts: shouts,
    );
  }

  void reloadShouts() async {
    List<DocumentSnapshot> shoutDocs = (await this.query.get()).docs;

    // 投稿リストを生成
    List<ShoutDetailState> shouts = [];

    // 投稿の詳細を取得
    for (DocumentSnapshot shoutDoc in shoutDocs) {
      String id; // 投稿ID
      String uid; // 投稿ユーザーID
      String userImagePath; // 投稿ユーザーイメージパス
      String userName; // 投稿ユーザー名
      String shoutDetail; // 投稿内容(文章)
      List<String> shoutImageList; // 投稿内容(画像)
      List<String> shoutMovieList; // 投稿内容(動画)
      List<String> shoutTagList; // 投稿タグ
      DateTime shoutTimeStamp;
      int shoutFavorite; // いいね数
      int shoutComments; // コメント数

      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 投稿ユーザー情報を取ってくる
          .collection(Strings.USERS)
          .doc(shoutDoc.data()[Strings.UID])
          .get();

      QuerySnapshot commentDocs = await FirebaseFirestore.instance // コメント情報を取ってくる
          .collection(Strings.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Strings.COMMENTS)
          .get();

      // 情報を設定
      id = shoutDoc.id;
      uid = userDoc.id;
      userImagePath = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
      userName = userDoc.data()[Strings.NAME];
      shoutDetail = shoutDoc.data()[Strings.DETAIL];
      shoutTimeStamp = shoutDoc.data()[Strings.TIMESTAMP].toDate();
      shoutFavorite = shoutDoc.data()[Strings.FAVORITE];
      shoutComments = commentDocs.size;

      // ↓この辺は後から
      shoutImageList = [];
      shoutMovieList = [];
      shoutTagList = [];

      // ShoutDetailStateインスタンスを生成
      ShoutDetailState shout = ShoutDetailState(id: id, uid: uid, userImagePath: userImagePath, userName: userName, shoutDetail: shoutDetail, shoutImageList: shoutImageList, shoutMovieList: shoutMovieList, shoutTagList: shoutTagList, shoutTimeStamp: shoutTimeStamp, shoutFavorite: shoutFavorite, shoutComments: shoutComments);

      // リストに格納する
      shouts.add(shout);
    }

    state = ShoutListState(
      shouts: shouts,
    );
  }

  void reloadShout(String shoutId) async {
    DocumentSnapshot shoutDoc = (await FirebaseFirestore.instance // 投稿を取得(とりあえず50件)
        .collection(Strings.SHOUTS)
        .doc(shoutId)
        .get());

    // 投稿の詳細を取得
    String id; // 投稿ID
    String uid; // 投稿ユーザーID
    String userImagePath; // 投稿ユーザーイメージパス
    String userName; // 投稿ユーザー名
    String shoutDetail; // 投稿内容(文章)
    List<String> shoutImageList; // 投稿内容(画像)
    List<String> shoutMovieList; // 投稿内容(動画)
    List<String> shoutTagList; // 投稿タグ
    DateTime shoutTimeStamp;
    int shoutFavorite; // いいね数
    int shoutComments; // コメント数

    DocumentSnapshot userDoc = await FirebaseFirestore.instance // 投稿ユーザー情報を取ってくる
        .collection(Strings.USERS)
        .doc(shoutDoc.data()[Strings.UID])
        .get();

    QuerySnapshot commentDocs = await FirebaseFirestore.instance // コメント情報を取ってくる
        .collection(Strings.SHOUTS)
        .doc(shoutDoc.id)
        .collection(Strings.COMMENTS)
        .get();

    // 情報を設定
    id = shoutDoc.id;
    uid = userDoc.id;
    userImagePath = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
    userName = userDoc.data()[Strings.NAME];
    shoutDetail = shoutDoc.data()[Strings.DETAIL];
    shoutTimeStamp = shoutDoc.data()[Strings.TIMESTAMP].toDate();
    shoutFavorite = shoutDoc.data()[Strings.FAVORITE];
    shoutComments = commentDocs.size;

    // ↓この辺は後から
    shoutImageList = [];
    shoutMovieList = [];
    shoutTagList = [];

    ShoutDetailState shout = ShoutDetailState(
        // ShoutDetailStateインスタンスを生成
        id: id,
        uid: uid,
        userImagePath: userImagePath,
        userName: userName,
        shoutDetail: shoutDetail,
        shoutImageList: shoutImageList,
        shoutMovieList: shoutMovieList,
        shoutTagList: shoutTagList,
        shoutTimeStamp: shoutTimeStamp,
        shoutFavorite: shoutFavorite,
        shoutComments: shoutComments);

    final currentState = state;

    List<ShoutDetailState> shouts = [];

    if (currentState is ShoutListStateData) {
      for (ShoutDetailState s in currentState.shouts) {
        if (s.id == shoutId) {
          shouts.add(shout);
        } else {
          shouts.add(s);
        }
      }
    }

    state = ShoutListState(
      shouts: shouts,
    );
  }
}
