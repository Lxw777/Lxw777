import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/icons.dart';
import 'package:todolist/controller/homeController.dart';
import 'package:todolist/model/task.dart';

// ignore: must_be_immutable
class AddCard extends StatelessWidget {
  AddCard({Key? key}) : super(key: key);
  final homecontrol = Get.find<Homecontroller>();
  @override
  // ignore: override_on_non_overriding_member
  final icons = getIcons();
  var squarewidth = Get.width - 20.0.wp;
  Widget build(BuildContext context) {
    return Container(
      width: squarewidth / 2,
      height: squarewidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: '任务类型',
              titleStyle: Theme.of(context).textTheme.headline5,
              content: Form(
                  key: homecontrol.formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                        child: TextFormField(
                          controller: homecontrol.titlecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: '标题',
                            labelStyle: Theme.of(context).textTheme.headline2,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return '请确认你的标题';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                        child: Wrap(
                          spacing: 2.0.wp,
                          children: icons
                              .map((e) => Obx(() {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      label: e,
                                      selectedColor: themecolor(context),
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      selected:
                                          homecontrol.chipIndex.value == index,
                                      onSelected: (bool selected) {
                                        homecontrol.chipIndex.value =
                                            selected ? index : 0;
                                      },
                                    );
                                  }))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                          width: 40.0.wp,
                          height: 6.0.hp,
                          child: ElevatedButton(
                              onPressed: () {
                                if (homecontrol.formkey.currentState!
                                    .validate()) {
                                  int icon = icons[homecontrol.chipIndex.value]
                                      .icon!
                                      .codePoint;
                                  String color =
                                      icons[homecontrol.chipIndex.value]
                                          .color!
                                          .toHex();
                                  var task = Task(
                                      title: homecontrol.titlecontroller.text
                                          .toString(),
                                      icon: icon,
                                      color: color);
                                  Get.back();
                                  homecontrol.addTask(task)
                                      ? EasyLoading.showSuccess('创建成功')
                                      : EasyLoading.showError('重复的任务');
                                }
                              },
                              child: Text("确认")))
                    ],
                  )));
          homecontrol.titlecontroller.clear();
          homecontrol.changeChipIndex(0);
        },
        child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            color: Colors.grey[400]!,
            dashPattern: const [8, 4],
            child: Center(
              child: Icon(
                Icons.add,
                size: 15.0.wp,
                color: Colors.grey,
              ),
            )),
      ),
    );
  }
}
