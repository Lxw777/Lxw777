import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/data/provideData/userInfoProvider.dart';
import 'package:todolist/model/userInfo.dart';

class UserInfoDetail extends StatefulWidget {
  const UserInfoDetail({super.key});

  @override
  State<UserInfoDetail> createState() => _UserInfoDetailState();
}

class _UserInfoDetailState extends State<UserInfoDetail> {
  //实例化选择图片
  final ImagePicker picker = new ImagePicker();
  //调用相机拍照

//用户本地图片
  File? _userImage; //存放获取到的本地路径
//异步吊起相机拍摄新照片方法

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    UserInfo user = Provider.of<UserInfoProvider>(context).readUserInfo();
    // String path = user.avatar!;
    // _userImage = File(user.avatar ?? '');

    TextEditingController textId = TextEditingController();
    TextEditingController textUid = TextEditingController();

    final themeColor = themecolor(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: themeColor,
        ),
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.check,
            ),
            label: Text(
              "保存",
              style: TextStyle(color: themeColor, fontSize: 20),
            ),
            onPressed: () {
              Provider.of<UserInfoProvider>(context, listen: false)
                  .writeUser(UserInfo(
                avatar: _userImage!.path,
                id: textId.text.isEmpty ? user.id : textId.text,
                uid: textUid.text.isEmpty ? user.uid : textUid.text,
                password: user.password,
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: imagePicker,
              child: Hero(
                tag: "avatar",
                child: ClipOval(
                    child: user.avatar == '' && _userImage == null
                        ? Image.asset(
                            "person.png",
                            width: 120,
                            height: 120,
                          )
                        : Image.file(
                            File(_userImage == null
                                ? user.avatar!
                                : _userImage!.path),
                            // user.avatar != null
                            //     ? _userImage!
                            //     : File(user.avatar!),
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          )),
              ),
            ),
          ),
          _bulidInfo("用户名", user.id!, textId),
          _bulidInfo("账号", user.uid!, textUid),
          // _bulidInfo(, content)
        ],
      ),
    );
  }

  _bulidInfo(String lable, String content, TextEditingController controller,
      {Color? color}) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(6),
      child: Column(
        children: [
          // Text(
          //   lable,
          //   style: mytheme.headline2,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 3),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintTextDirection: TextDirection.rtl,
                labelText: lable,
                hintText: content,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: false,
            ),
            // TextField(
            //   autofocus: false,
            //   controller: controller,
            //   decoration: InputDecoration(
            //       hintText: content, hintTextDirection: TextDirection.rtl),
            //   //设置最大行数
            //   maxLines: 1,
            // ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    ));
  }

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
          print('你选择的本地路径是：${_userImage!.path}');
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
}
