import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todolist/app/widgets/check.dart';
import 'package:todolist/controller/homeController.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    final control = Get.find<Homecontroller>();
    var createdTasks = control.getTotalTask();
    var completedTasks = control.getTotalDoneTask();
    var precent = (completedTasks / createdTasks * 100).toStringAsFixed(0);
    return UnconstrainedBox(
      child: CircularPercentIndicator(
          radius: 150.0,
          lineWidth: 20.0,
          animation: true,
          animationDuration: 500,
          percent: completedTasks / createdTasks,
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: Color(0xffe2ebf0),
          linearGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [
                    Color(0xff13547a),
                    Color(0xff80d0c7),
                  ]
                : [
                    Color(0xfff83600),
                    Color(0xfffda085),
                  ],
          ),
          center: CheckIn(
            createdTasks: completedTasks,
            precent: precent,
          )),
    );
  }
}
