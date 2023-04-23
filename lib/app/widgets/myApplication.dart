import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/icons.dart';
import 'package:todolist/app/pages/addToDo.dart';
import 'package:todolist/app/pages/checkIn.dart';
import 'package:todolist/app/pages/home.dart';

import 'package:todolist/app/pages/progress.dart';
import 'package:todolist/app/widgets/drawer.dart';
import 'package:todolist/controller/homeController.dart';
import 'package:todolist/model/task.dart';

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  MyApplication({Key? key}) : super(key: key);
  var control = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DragTarget<Task>(
        builder: (BuildContext context, List<Task?> t, List<dynamic> d) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor:
                  control.deleting.value ? Colors.red : themecolor(context),
              onPressed: () {
                if (control.tasks.isNotEmpty) {
                  Get.to(() => AddToDo(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo("请创建你的任务类型");
                }
              },
              child: Icon(control.deleting.value ? Icons.delete : Icons.add,
                  color: Colors.white, size: 30),
            ),
          );
        },
        onAccept: (Task task) {
          control.deletetask(task);
          EasyLoading.showSuccess("任务删除成功");
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          // color: Colors.grey.shade100,
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    control.changemypage(0);
                  },
                  icon: Icon(
                    Icons.fact_check,
                    // color: Colors.white,
                    color: themecolor(context),
                    size: 30,
                  )),

              // Padding(
              //   padding: EdgeInsets.only(right: 10.0.wp),
              //   child:
              // IconButton(
              //     onPressed: () {
              //       control.changemypage(1);
              //     },
              //     icon: Icon(
              //       MyFlutterApp.check, color: themecolor(context),
              //       // color: Colors.white,
              //       size: 23,
              //     )),
              // ),
              IconButton(
                  onPressed: () {
                    control.changemypage(1);
                  },
                  icon: Icon(Icons.donut_large_outlined,
                      color: themecolor(context),
                      // color: Colors.white,
                      size: 30)),
            ],
          )),
      body: PageView(
        controller: control.mypage,
        children: [
          Home(),
          // CheckIn(),
          MyProgress(),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
