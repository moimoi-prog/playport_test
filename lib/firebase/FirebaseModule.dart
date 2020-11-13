import 'package:firebase_core/firebase_core.dart';

import 'GoogleAuthModule.dart';


// ------------------------------
// 初期化
// ------------------------------
Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
  await signInWithGoogleSilently();
}
