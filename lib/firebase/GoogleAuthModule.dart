import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firestore/PostModule.dart';
import 'firestore/UsersModule.dart';

// ------------------------------
// 変数を宣言
// ------------------------------
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
User user;

// ------------------------------
// Googleアカウントでログイン(初期)
// ------------------------------
Future<void> signInWithGoogleSilently() async {
  // グーグルアカウントを取得
  GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

  try {
    //　過去のログイン情報を元にログイン
    if (googleCurrentUser == null) {
      googleCurrentUser = await _googleSignIn.signInSilently();
    }

    // ログインしなかった場合、以降の処理を行わない
    if (googleCurrentUser == null) {
      return;
    }

    // 認証を行う
    GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;

    // 信任状を作成
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );

    // 信任状を用いて認証を行い、結果のユーザーを返す
    user = (await _auth.signInWithCredential(credential)).user;

    // サインインしたことをログにアウトプット
    print("signed in" + user.displayName);

  } catch (e) {
    if (e is PlatformException) {
      switch (e.code) {
        case GoogleSignIn.kSignInFailedError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInFailedError");
          break;
        case GoogleSignIn.kSignInCanceledError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInCanceledError");
          break;
        case GoogleSignIn.kSignInRequiredError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInRequiredError");
          break;
        case GoogleSignInAccount.kFailedToRecoverAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kFailedToRecoverAuthError");
          break;
        case GoogleSignInAccount.kUserRecoverableAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kUserRecoverableAuthError");
          break;
        default:
          Fluttertoast.showToast(msg: "default");
          break;
      }
    }
  }
}

// ------------------------------
// Googleアカウントでログイン
// ------------------------------
Future<void> signInWithGoogle() async {
  // グーグルアカウントを取得
  GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

  try {
    //　過去のログイン情報を元にログイン
    if (googleCurrentUser == null) {
      googleCurrentUser = await _googleSignIn.signInSilently();
    }

    // ダイアログを開いてログイン
    if (googleCurrentUser == null) {
      googleCurrentUser = await _googleSignIn.signIn();
    }

    // ログインしなかった場合、以降の処理を行わない
    if (googleCurrentUser == null) {
      return;
    }

    // 認証を行う
    GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;

    // 信任状を作成
    final AuthCredential credential = GoogleAuthProvider.credential(
        // idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,

    );

    // 信任状を用いて認証を行い、結果のユーザーを返す
    user = (await _auth.signInWithCredential(credential)).user;

    // ユーザーがforestoreに登録されていない場合、登録する
    final doc = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

    if (!doc.exists) {
      await registerUser(user.displayName, user.uid, user.email);
    }

    // サインアウトしたことをログにアウトプット
    print("signed in" + user.displayName);

  } catch (e) {
    if (e is PlatformException) {
      switch (e.code) {
        case GoogleSignIn.kSignInFailedError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInFailedError");
          break;
        case GoogleSignIn.kSignInCanceledError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInCanceledError");
          break;
        case GoogleSignIn.kSignInRequiredError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInRequiredError");
          break;
        case GoogleSignInAccount.kFailedToRecoverAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kFailedToRecoverAuthError");
          break;
        case GoogleSignInAccount.kUserRecoverableAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kUserRecoverableAuthError");
          break;
        default:
          Fluttertoast.showToast(msg: "default");
          break;
      }
    }
  }
}

// ------------------------------
// Googleアカウントでログイン
// ------------------------------
Future<void> signOutWithGoogle() async {
  // グーグルアカウントを取得
  GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

  try {
    // ログインしていない場合、以降の処理を行わない
    if (googleCurrentUser == null) {
      return;
    }

    // ログアウトする
    googleCurrentUser = await _googleSignIn.signOut();

    // ユーザー情報をリセットする
    user = null;

    // サインアウトしたことをログにアウトプット
    print("サインアウト:" + user.displayName);

  } catch (e) {
    if (e is PlatformException) {
      switch (e.code) {
        case GoogleSignIn.kSignInFailedError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInFailedError");
          break;
        case GoogleSignIn.kSignInCanceledError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInCanceledError");
          break;
        case GoogleSignIn.kSignInRequiredError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kSignInRequiredError");
          break;
        case GoogleSignInAccount.kFailedToRecoverAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kFailedToRecoverAuthError");
          break;
        case GoogleSignInAccount.kUserRecoverableAuthError:
          Fluttertoast.showToast(msg: "GoogleSignIn.kUserRecoverableAuthError");
          break;
        default:
          Fluttertoast.showToast(msg: "default");
          break;
      }
    }
  }
}
