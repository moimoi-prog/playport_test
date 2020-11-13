import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';
import 'package:state_notifier/state_notifier.dart';

import 'CreateGroupState.dart';
import 'Friend.dart';

class CreateGroupNotifier extends StateNotifier<CreateGroupState> with LocatorMixin {
  CreateGroupNotifier() : super(const CreateGroupState.loading());

  // 初期化
  @override
  void initState() async {
    super.initState();

    state = CreateGroupState(imagePath: "", groupNameController: TextEditingController(text: ""), selectedFriends: [], friends: []);
  }

  // フレンド情報を取得する
  Future<bool> setFriends() async {
    final currentState = state;

    List<Friend> friends = await getFriends(user.uid).then((value) {
      List<Friend> friends = [];

      value.forEach((element) {
        friends.add(
            Friend(
                uid: element.data()[Strings.UID]
            )
        );
      });

      return friends;
    });

    if (currentState is CreateGroupStateData) {
      state = currentState.copyWith(friends: friends);
    } else {
      state = CreateGroupState(friends: friends);
    }


    return true;
  }

  // 内容をリセットする
  void setImagePath(String path) {
    final currentState = state;

    if (currentState is CreateGroupStateData) {
      state = currentState.copyWith(imagePath: path, groupNameController: currentState.groupNameController, friends: currentState.friends);
    } else {
      state = CreateGroupState(imagePath: path, groupNameController: TextEditingController(), friends: []);
    }
  }

  // 内容をリセットする
  void reset() {
    final currentState = state;

    if (currentState is CreateGroupStateData) {
      state = currentState.copyWith(imagePath: "", groupNameController: TextEditingController(), selectedFriends: [], friends: []);
    } else {
      state = CreateGroupState(imagePath: "", groupNameController: TextEditingController(), selectedFriends: [], friends: []);
    }
  }

  // 選択状態を更新する
  void check(Friend friend) {
    final currentState = state;

    if (currentState is CreateGroupStateData) {
      List<String> selected = currentState.selectedFriends;

      // チェック状態を更新
      final clone = currentState.friends.map((f) {
        if (f == friend) {
          if (!f.completed) {
            selected.add(f.uid);
          } else {
            selected.remove(f.uid);
          }
          return f.copyWith(
            completed: !f.completed,
          );
        }
        return f;
      }).toList();




      state = currentState.copyWith(
        selectedFriends: selected,
        friends: clone,
      );
    }
  }
}
