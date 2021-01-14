import 'package:apey/src/models/UserInfo.dart';
import 'package:flutter/cupertino.dart';

class UserInfoProvider with ChangeNotifier {
  UserInfo _userInfo;

  UserInfo get userInfo => _userInfo;

  setUserInfo(String email, String pw, String username, String fullName,
      String gender) {
    _userInfo = UserInfo(email, pw, username, fullName, gender);
    notifyListeners();
  }
}
