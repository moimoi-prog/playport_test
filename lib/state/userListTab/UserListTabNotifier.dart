import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/MatchingType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import 'Matching.dart';
import 'UserListTabState.dart';

class UserListTabNotifier extends StateNotifier<UserListTabState> with LocatorMixin {
  UserListTabNotifier() : super(const UserListTabState.loading());

  // 初期化
  @override
  void initState() async {
    super.initState();

    List<DocumentSnapshot> querys = (await FirebaseFirestore.instance.collection(Strings.USERS).get()).docs;
    List<Matching> matchings = [];

    for (DocumentSnapshot doc in querys) {
      String game;
      MatchingType status;

      QuerySnapshot gameDocs = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.GAMES).get();

      if (gameDocs.size == 0) {
        game = "";
      } else {
        game = gameDocs.docs[0].data()[Strings.NAME];
      }

      if (doc.id != user.uid) {
        DocumentSnapshot friendDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).doc(doc.id).get();

        if (friendDoc.exists) {
          status = MatchingType.friend;
        } else {
          DocumentSnapshot requestDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.FRIENDS).doc(user.uid).get();

          if (requestDoc.exists) {
            status = MatchingType.sending;
          } else {
            status = MatchingType.others;
          }
        }
      } else {
        status = MatchingType.person;
      }

      Matching matching = Matching();

      matching.image = doc.data()[Strings.PROFILE_IMAGE_PATH];
      matching.uid = doc.data()[Strings.UID];
      matching.name = doc.data()[Strings.NAME];
      matching.introduction = doc.data()[Strings.INTRODUCTION];
      matching.game = game;
      matching.status = status;

      matchings.add(matching);
    }

    state = UserListTabState(matchings: matchings);
  }

  // ユーザー情報を取得する
  Future<bool> setMatchings(String postId) async {
    final currentState = state;

    List<DocumentSnapshot> querys = (await FirebaseFirestore.instance.collection(Strings.USERS).get()).docs;
    List<Matching> matchings = [];

    for (DocumentSnapshot doc in querys) {
      String game;
      MatchingType status;

      QuerySnapshot gameDocs = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.GAMES).get();

      if (gameDocs.size == 0) {
        game = "";
      } else {
        game = gameDocs.docs[0].data()[Strings.NAME];
      }

      if (doc.id != user.uid) {
        DocumentSnapshot friendDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).doc(doc.id).get();

        if (friendDoc.exists) {
          status = MatchingType.friend;
        } else {
          DocumentSnapshot requestDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.FRIENDS).doc(user.uid).get();

          if (requestDoc.exists) {
            status = MatchingType.sending;
          } else {
            status = MatchingType.others;
          }
        }
      } else {
        status = MatchingType.person;
      }

      Matching matching = Matching();

      matching.image = doc.data()[Strings.PROFILE_IMAGE_PATH];
      matching.uid = doc.data()[Strings.UID];
      matching.name = doc.data()[Strings.NAME];
      matching.introduction = doc.data()[Strings.INTRODUCTION];
      matching.game = game;
      matching.status = status;

      matchings.add(matching);
    }

    if (currentState is UserListTabStateData) {
      state = currentState.copyWith(matchings: matchings);
    } else {
      state = UserListTabState(matchings: matchings);
    }

    return true;
  }

  // 内容をリセットする
  void reset() {
    final currentState = state;

    if (currentState is UserListTabStateData) {
      state = currentState.copyWith(matchings: []);
    } else {
      state = UserListTabState(matchings: []);
    }
  }

  Future<void> reload() async {
    List<DocumentSnapshot> querys = (await FirebaseFirestore.instance.collection(Strings.USERS).get()).docs;
    List<Matching> matchings = [];

    for (DocumentSnapshot doc in querys) {
      String game;
      MatchingType status;

      QuerySnapshot gameDocs = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.GAMES).get();

      if (gameDocs.size == 0) {
        game = "";
      } else {
        game = gameDocs.docs[0].data()[Strings.NAME];
      }

      if (doc.id != user.uid) {
        DocumentSnapshot friendDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).doc(doc.id).get();

        if (friendDoc.exists) {
          status = MatchingType.friend;
        } else {
          DocumentSnapshot requestDoc = await FirebaseFirestore.instance.collection(Strings.USERS).doc(doc.id).collection(Strings.FRIENDS).doc(user.uid).get();

          if (requestDoc.exists) {
            status = MatchingType.sending;
          } else {
            status = MatchingType.others;
          }
        }
      } else {
        status = MatchingType.person;
      }

      Matching matching = Matching();

      matching.image = doc.data()[Strings.PROFILE_IMAGE_PATH];
      matching.uid = doc.data()[Strings.UID];
      matching.name = doc.data()[Strings.NAME];
      matching.introduction = doc.data()[Strings.INTRODUCTION];
      matching.game = game;
      matching.status = status;

      matchings.add(matching);
    }

    state = UserListTabState(matchings: matchings);
  }
}
