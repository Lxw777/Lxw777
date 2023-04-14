import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todolist/app/data/store/sevices.dart';
import 'package:todolist/model/userInfo.dart';

//信息管理
class UserInfoProvider extends ChangeNotifier {
  final _store = Get.find<StoreService>();
  // late UserInfo _userInfo;
  // UserInfo get userInfo => _userInfo;

  // UserInfoProvider() {
  //   _userInfo = readUserInfo();
  // }

  UserInfo readUserInfo() {
    UserInfo user = _store.read("user") != null
        ? UserInfo.fromJson(jsonDecode(_store.read("user")))
        : UserInfo(
            avatar: "",
            id: "未登录",
            uid: "00000",
            password: "000000",
          );

    return user;
  }

  void writeUser(UserInfo userInfo) {
    var temp = jsonEncode(userInfo.toJson());
    _store.writeUserInfo("user", temp);
    print("写入信息");
    notifyListeners();
  }
}
