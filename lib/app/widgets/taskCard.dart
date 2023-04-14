import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/pages/cardDetail.dart';
import 'package:todolist/controller/homeController.dart';
import 'package:todolist/model/task.dart';

class TaskCard extends StatelessWidget {
  TaskCard({Key? key, required this.task}) : super(key: key);
  final Homecontrol = Get.find<Homecontroller>();
  final Task task;
  @override
  Widget build(BuildContext context) {
    var squarewidth = Get.width - 20.0.wp;
    final color = HexColor.fromHex(task.color);
    return GestureDetector(
      onTap: () {
        Homecontrol.changeTask(task);
        Homecontrol.changeTodos(task.todos ?? []);
        Get.to(() => DetailPage());
      },
      child: Container(
        width: squarewidth / 2,
        height: squarewidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Color.fromARGB(255, 65, 65, 65)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Theme.of(context).brightness == Brightness.dark
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  )
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StepProgressIndicator(
                totalSteps:
                    Homecontrol.isTodoEmpty(task) ? 1 : task.todos!.length,
                currentStep: Homecontrol.isTodoEmpty(task)
                    ? 0
                    : Homecontrol.getDoneTodo(task),
                roundedEdges: const Radius.circular(10),
                size: 5,
                padding: 0,
                selectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [color.withOpacity(0.4), color]),
                unselectedGradientColor: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Colors.white, Colors.white]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Icon(IconData(task.icon, fontFamily: 'MyFlutterApp'),
                  color: color, size: 35),
            ),
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: mytheme.headline5,
                    softWrap: true,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 1.0.wp,
                  ),
                  Text(
                    '${task.todos?.length ?? 0} 任务',
                    style: mytheme.headline2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
