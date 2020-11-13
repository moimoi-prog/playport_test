// ----------------------------------------
// FormData
// アカウント登録ページ使用データ
// ----------------------------------------
class FormData {
  String id;
  String password;
  String password_re;

  FormData() {
    id = null;
    password = null;
    password_re = null;
  }

  FormData.id(this.id);
}