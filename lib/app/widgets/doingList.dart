import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/controller/homeController.dart';

//正在做
class DoingList extends StatelessWidget {
  DoingList({Key? key}) : super(key: key);
  final control = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => control.doingTodos.isEmpty && control.doneTodos.isEmpty
        ? Column(
            children: [
              Image.asset(
                'assets/none.png',
                fit: BoxFit.cover,
                width: 65.0.wp,
              ),
              Text('添加任务', style: Theme.of(context).textTheme.headline4)
            ],
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...control.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0.wp, horizontal: 9.0.wp),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.grey),
                                    value: element['done'],
                                    onChanged: (value) {
                                      control.doneTodo(element['title']);
                                    }),
                              ),
                            ),
                            Flexible(
                              flex: 9,
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.0.wp),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      element['title'],
                                      style: mytheme.headline2,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (control.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(
                    thickness: 2,
                  ),
                )
            ],
          ));
  }
}
