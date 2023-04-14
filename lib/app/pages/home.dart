import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/widgets/addCard.dart';
import 'package:todolist/app/widgets/taskCard.dart';
import 'package:todolist/controller/homeController.dart';

// ignore: must_be_immutable
class Home extends GetView<Homecontroller> {
  Home({Key? key}) : super(key: key);
  var control = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 4.0.wp, bottom: 2.0.wp, top: 5.0.wp),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: themecolor(context),
                    size: 35,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 4.0.wp, bottom: 2.0.wp, right: 4.0.wp, top: 4.0.wp),
                child: Text(
                  'My List',
                  // style: Theme.of(context).textTheme.headline4,

                  style: TextStyle(
                      fontFamily: "MiSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 36),
                  // style: mytheme.headline4,
                ),
              ),
            ],
          ),
          Obx(() {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...control.tasks
                    .map((element) => LongPressDraggable(
                        data: element,
                        onDragStarted: () => control.changeDeleting(true),
                        onDraggableCanceled: (_, __) =>
                            control.changeDeleting(false),
                        onDragEnd: (_) => control.changeDeleting(false),
                        feedback: Opacity(
                          opacity: 0.8,
                          child: TaskCard(task: element),
                        ),
                        child: TaskCard(task: element)))
                    .toList(),
                AddCard()
              ],
            );
          }),
        ],
      )),
    );
  }
}
