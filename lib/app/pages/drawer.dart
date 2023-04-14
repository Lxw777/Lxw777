import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/data/provideData/darkThemeProvider.dart';
import 'package:todolist/app/data/provideData/userInfoProvider.dart';
import 'package:todolist/app/pages/intro.dart';
import 'package:todolist/app/pages/details.dart';
import 'package:todolist/app/pages/login.dart';
import 'package:todolist/app/pages/setting.dart';

import 'package:todolist/main.dart';
import 'package:todolist/model/userInfo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfo user = Provider.of<UserInfoProvider>(context).readUserInfo();

    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: GestureDetector(
                onTap: () => Get.to(UserInfoDetail()),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Hero(
                        tag: "avatar",
                        child: ClipOval(
                          child: user.avatar == ''
                              ? Image.asset(
                                  "person.png",
                                  width: 80,
                                )
                              : Image.file(
                                  File(user.avatar!),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                          // Image.network(
                          //     user.avatar!,
                          //     width: 80,
                          //     height: 80,
                          //     fit: BoxFit.fill,
                          //   ),
                        ),
                      ),
                    ),
                    Text(
                      user.id!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: () => Get.to(LoginPage()),
                    leading: const Icon(Icons.settings_outlined),
                    title: Text(
                      '登录页',
                      style: mytheme.headline2,
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(SettingPage()),
                    leading: const Icon(Icons.settings_outlined),
                    title: Text('设置页面', style: mytheme.headline2),
                  ),
                  ListTile(
                    onTap: () => EasyLoading.showSuccess(
                      '功能发开中',
                    ),
                    leading: const Icon(Icons.done_all),
                    title: Text('每日打卡', style: mytheme.headline2),
                  ),
                  ListTile(
                    onTap: () {
                      preferences!.setBool("intro", false);
                      Get.to(Intro());
                    },
                    leading: const Icon(Icons.add),
                    title: Text('设置日程', style: mytheme.headline2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: Text('ARKNIGHT', style: mytheme.headline2),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Provider.of<DarkThemeProvider>(context, listen: false)
                            .pressFollow();
                      },
                      child: Text("深色模式 >", style: mytheme.headline2),
                    ),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? Icon(Icons.brightness_5)
                        : Icon(Icons.brightness_2),
                    trailing: Provider.of<DarkThemeProvider>(
                      context,
                    ).followSystem
                        ? Text("跟随系统")
                        : CupertinoSwitch(
                            value: Provider.of<DarkThemeProvider>(context,
                                    listen: false)
                                .isDark,
                            onChanged: (value) {
                              Provider.of<DarkThemeProvider>(context,
                                      listen: false)
                                  .switchTheme(value);
                            }),
                  ),
                ],
              ),
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.disabled_by_default),
                label: Text("退出登录"))
          ],
        ),
      ),
    );
  }

  // bool isImageUrl(String url) {
  //   RegExp exp = RegExp(
  //       r"(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]");
  //   return exp.hasMatch(url);
  // }
}
