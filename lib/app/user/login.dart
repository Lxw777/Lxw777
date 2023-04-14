import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //实例化选择图片
  final ImagePicker picker = new ImagePicker();
  //调用相机拍照

//用户本地图片
  File? _userImage; //存放获取到的本地路径
//异步吊起相机拍摄新照片方法
  Future _getCameraImage() async {
    final cameraImages = await picker.pickImage(source: ImageSource.camera);
    if (mounted) {
      setState(() {
        //拍摄照片不为空
        if (cameraImages != null) {
          _userImage = File(cameraImages.path);
          print('你选择的路径是：${_userImage.toString()}');
          //图片为空
        } else {
          print('没有照片可以选择');
        }
      });
    }
  }

  Future _getImage() async {
    //选择相册
    final pickerImages = await picker.pickImage(source: ImageSource.gallery);
    if (mounted) {
      setState(() {
        if (pickerImages != null) {
          _userImage = File(pickerImages.path);
          print('你选择的本地路径是：${_userImage.toString()}');
        } else {
          print('没有照片可以选择');
        }
      });
    }
  }

  void imagePicker() {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: [
              ListTile(
                title: Text("使用摄像头上传"),
                onTap: () {
                  _getCameraImage();
                  Get.back();
                },
              ),
              ListTile(
                  title: Text("使用相册上传"),
                  onTap: () {
                    _getImage();
                    Get.back();
                  }),
            ],
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.3),
        barrierColor: Colors.black.withOpacity(0.1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: imagePicker, child: Text("图片设置测试按钮")),
          GestureDetector(
            onTap: imagePicker,
            child: Container(
                child: _userImage == null
                    ? Container()
                    : ClipOval(
                        child: Image.file(_userImage!,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width))),
          ),
        ],
      ),
    );
    // Scaffold(
    //   appBar: buildAppBar(context),
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       // WelcomeBack(),
    //       // LoginForm(),
    //       Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 30),
    //         alignment: Alignment.centerRight,
    //         child: Text(
    //           'Forgot password?',
    //           // style: TextStyle(color: mPrimaryColor),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 60,
    //       ),
    //       // LoginButton(),
    //       Container(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 30,
    //           vertical: 16,
    //         ),
    //         alignment: Alignment.center,
    //         child: RichText(
    //           text: TextSpan(style: TextStyle(color: Colors.grey), children: [
    //             TextSpan(text: 'Don\'t have an account? '),
    //             TextSpan(
    //               text: 'Register',
    //               style: TextStyle(
    //                   // color: mPrimaryColor,
    //                   ),
    //               recognizer: TapGestureRecognizer()
    //                 ..onTap = () {
    //                   Navigator.pop(context);
    //                 },
    //             ),
    //           ]),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
