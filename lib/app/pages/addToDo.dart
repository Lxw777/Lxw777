import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/controller/homeController.dart';

class AddToDo extends StatelessWidget {
  AddToDo({Key? key}) : super(key: key);
  final control = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.back();
          control.titlecontroller.clear();
          control.changeTask(null);
          return true;
        },
        child: SafeArea(
          child: Form(
            key: control.formkey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                            control.titlecontroller.clear();
                            control.changeTask(null);
                          },
                          icon: const Icon(Icons.close, color: lightcolor)),
                      TextButton(
                        onPressed: () {
                          if (control.formkey.currentState!.validate()) {
                            if (control.task.value == null) {
                              EasyLoading.showError('请选择你的任务类型');
                            } else {
                              var success = control.updateTask(
                                control.task.value!,
                                control.titlecontroller.text,
                              );
                              if (success) {
                                EasyLoading.showSuccess('To-Do 添加成功');
                                Get.back();
                                control.changeTask(null);
                              } else {
                                EasyLoading.showError('To-Do 已存在');
                              }
                              control.titlecontroller.clear();
                            }
                          }
                        },
                        child: Text(
                          "完成",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "新建 To-Do",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5.0.wp, vertical: 5.0.wp),
                  child: TextFormField(
                    controller: control.titlecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: '添加 To-Do',
                      labelStyle: Theme.of(context).textTheme.headline2,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '请确认 To-Do ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0.wp),
                  child:
                      Text("添加到", style: Theme.of(context).textTheme.headline2),
                ),
                ...control.tasks
                    .map((element) => Obx(
                          () => InkWell(
                            onTap: () => control.changeTask(element),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0.wp,
                                  bottom: 3.0.wp,
                                  right: 5.0.wp,
                                  top: 3.0.wp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        IconData(
                                          element.icon,
                                          fontFamily: "MyFlutterApp",
                                        ),
                                        color: HexColor.fromHex(element.color),
                                      ),
                                      SizedBox(width: 3.0.wp),
                                      Text(
                                        element.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                  if (control.task.value == element)
                                    const Icon(
                                      Icons.check,
                                      color: lightcolor,
                                      size: 30,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
