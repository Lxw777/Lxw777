import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todolist/app/constValue/store_key.dart';
import 'package:todolist/app/data/store/sevices.dart';
import 'package:todolist/model/userInfo.dart';

//信息管理
class UserInfoProvider extends ChangeNotifier {
  final _store = Get.find<StoreService>();
  UserInfo readUserInfo() {
    UserInfo user = _store.read(StoreConst.User) != null
        ? UserInfo.fromJson(jsonDecode(_store.read(StoreConst.User)))
        : UserInfo(
            avatar: "",
            id: "未登录",
            uid: "000000",
            password: "000000",
            qq: "000000",
            phone: "00000000000");

    return user;
  }

  void writeUser(UserInfo userInfo) {
    var temp = jsonEncode(userInfo.toJson());
    _store.write(StoreConst.User, temp);
    print("写入信息");
    notifyListeners();
  }

  void logout() {
    _store.write(
        StoreConst.User,
        jsonEncode(UserInfo(
                avatar: "",
                id: "未登录",
                uid: "000000",
                password: "000000",
                qq: "000000",
                phone: "00000000000")
            .toJson()));
    print("清空信息");
    notifyListeners();
  }
}
