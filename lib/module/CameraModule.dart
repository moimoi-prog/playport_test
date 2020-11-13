import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'CommonModule.dart';

// ドキュメントのパスを取得
Future get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// 画像をドキュメントへ保存する
Future saveLocalImage(File image) async {
  String formatted = getFormattedDate('yyyyMMddHHmmss');

  final documentPath = await localPath;
  final imagePath = "$documentPath/$formatted-image.jpg";

  File imageFile = File(imagePath);

  // 一時フォルダに保存された画像をドキュメントへ保存し直す
  var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());

  return saveFile;
}

// ドキュメントの画像を取得する
Future leadLocalImage() async {
  String formatted = getFormattedDate('yyyyMMddHHmmss');

  final path = await localPath;
  final imagePath = "$path/$formatted-image.jpg";
  return File(imagePath);
}

Future<File> getAndSaveImageFromDevice(ImageSource source) async {
  // 撮影した画像を取得
  final picker = ImagePicker();
  var pickImage = await picker.getImage(source: source);

  // 撮影せず閉じた場合はnullが格納される
  if (pickImage == null) {
    return null;
  }

  File image = File(pickImage.path);

  var saveFile = await saveLocalImage(image);

  return saveFile;
}
