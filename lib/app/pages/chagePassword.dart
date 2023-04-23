import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:rive/rive.dart';
import 'package:todolist/app/const/colors.dart';

import 'package:todolist/app/widgets/gradientButton.dart';

import 'package:todolist/dio/DioUtil.dart';

class ChangePassWordPage extends StatefulWidget {
  const ChangePassWordPage({super.key});

  @override
  State<ChangePassWordPage> createState() => _ChangePassWordPageState();
}

class _ChangePassWordPageState extends State<ChangePassWordPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    oldpasswordController.dispose();
    newpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? darkcolor
        : lightcolor;

    return Scaffold(
      appBar: AppBar(
        title: Text("修改密码"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 24.0),
                      TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: '账号',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: oldpasswordController,
                        decoration: InputDecoration(
                          labelText: '旧密码',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: oldpasswordController,
                        decoration: InputDecoration(
                          labelText: '新密码',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(height: 25.0),
                      SizedBox(height: 16.0),
                      GradientButton(
                        child: Text('确认修改密码'),
                        tapCallback: () async {
                          // print(1);
                          // // HubUtil.show(msg: "登录中", dismissOnTap: false);
                          // Map<String, String> params = {
                          //   "phoneNum": "${userController.text}",
                          //   "password": "${oldpasswordController.text}"
                          // };

                          // var result = await DioUtil().request('login/login',
                          //     params: params, method: DioMethod.post);
                          // print(result.runtimeType);
                          // print(result);

                          // // if (result["msg"] == "") Get.to(MyApplication());
                          // // HubUtil.dismiss;
                          // print(result);
                        },
                        borderRadius: BorderRadius.circular(10),
                        colors: [color.withOpacity(0.5), color],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
