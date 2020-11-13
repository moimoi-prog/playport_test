import 'dart:io';
import 'dart:math';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:intl/intl.dart';

// -----------------------------------------
// メソッド名 : getFormattedDate
// 処理概要　 : フォーマットを指定して日付文字列を返す
// 引　　　数 : format ... 指定するフォーマット
//          : date ... 変換する日付(指定しない場合、今日)
// -----------------------------------------
String getFormattedDate(String format, [DateTime date]) {
  // 日付が指定されていない場合、現在の日付を指定
  if (date == null) {
    date = new DateTime.now();
  }

  // フォーマットを生成
  var formatter = new DateFormat(format);

  // 日付を整形
  String formatted = formatter.format(date);

  // リターン
  return formatted;

}

// -----------------------------------------
// メソッド名 : imageCompression
// 処理概要　 : 画像を圧縮する
// -----------------------------------------
Future<File> imageCompression(File file, int width, int height) async {
  File ret = await FlutterNativeImage.compressImage(
      file.path,
      quality: 80,
      targetWidth: width,
      targetHeight: height
  );

  return ret;
}

// -----------------------------------------
// メソッド名 : imageCompression
// 処理概要　 : 画像を圧縮する
// -----------------------------------------
Future<File> imageCompressionToPath(String path, int width, int height) async {
  File ret = await FlutterNativeImage.compressImage(
      path,
      quality: 80,
      targetWidth: width,
      targetHeight: height
  );

  return ret;
}

// -----------------------------------------
// メソッド名 : randomString
// 処理概要　 : ランダムな文字列を生成する
// -----------------------------------------
String randomString(int length) {
  const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const _charsLength = _randomChars.length;

  final rand = new Random();
  final codeUnits = new List.generate(
    length,
        (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },
  );
  return new String.fromCharCodes(codeUnits);
}


