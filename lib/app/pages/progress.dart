import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:intl/intl.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/controller/homeController.dart';

class MyProgress extends StatelessWidget {
  MyProgress({Key? key}) : super(key: key);
  final control = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Obx(() {
      var createdTasks = control.getTotalTask();
      var completedTasks = control.getTotalDoneTask();
      var livetasks = createdTasks - completedTasks;
      var precent = (completedTasks / createdTasks * 100).toStringAsFixed(0);
      return ListView(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 4.0.wp, bottom: 2.0.wp, top: 5.0.wp),
                child: Icon(
                  Icons.data_saver_off_rounded,
                  color: themecolor(context),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 4.0.wp, bottom: 2.0.wp, right: 4.0.wp, top: 4.0.wp),
                child: Text(
                  'My Progress',
                  style: TextStyle(
                      fontFamily: "MiSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 36),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(DateFormat('EEE', "en_US").format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: "NoveCentoWide",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? darkcolor
                            : deepblue)),
                SizedBox(
                  width: 7,
                ),
                Text(DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "NoveCentoWide",
                    )),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.wp, horizontal: 4.0.wp),
            child: const Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 5.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                progress(deepPink, livetasks, 'undone', context),
                progress(green, completedTasks, 'done', context),
                progress(blue, createdTasks, 'created', context)
              ],
            ),
          ),
          SizedBox(height: 15.0.wp),
          UnconstrainedBox(
            child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 20.0,
                // animateFromLastPercent: true,
                // restartAnimation: true,
                animation: true,
                animationDuration: 500,
                percent: completedTasks / createdTasks,
                circularStrokeCap: CircularStrokeCap.butt,
                // backgroundColor: Color(0xffe2ebf0),
                linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          Color(0xff13547a),
                          Color(0xff80d0c7),
                        ]
                      : [
                          Color(0xff84fab0),
                          Color(0xff8fd3f4),
                        ],
                ),
                center: GestureDetector(
                  onTap: () {
                    EasyLoading.showSuccess('您昨日的效率已经超越99%用户');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${createdTasks == 0 ? 0 : precent} %',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 1.0.wp,
                      ),
                      Text(
                        "Efficiency",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "NoveCentoWide",
                            color: themecolor(context),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
                //   CircularStepProgressIndicator(
                // // customColor: customcolor,
                // totalSteps: (createdTasks == 0 ? 1 : createdTasks),
                // currentStep: completedTasks,
                // stepSize: 20,
                // selectedColor: lightcolor,
                // unselectedColor: Colors.grey[200],
                // padding: 0,
                // width: 150,
                // height: 150,
                // selectedStepSize: 24,
                // roundedCap: (_, __) => true,
                // child: GestureDetector(
                //   onTap: () {
                //     EasyLoading.showSuccess('您昨日的效率已经超越99%用户');
                //   },
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         '${createdTasks == 0 ? 0 : precent} %',
                //         style: Theme.of(context).textTheme.headline4,
                //       ),
                //       SizedBox(
                //         height: 1.0.wp,
                //       ),
                //       Text(
                //         "Efficiency",
                //         style: TextStyle(
                //             fontSize: 17,
                //             fontFamily: "NoveCentoWide",
                //             color: themecolor(context),
                //             fontWeight: FontWeight.w700),
                //       )
                //     ],
                //   ),
                // ),
                // ),
                ),
          )
        ],
      );
    })));
  }

  // Color customcolor(int step) {
  //   var createdTasks = control.getTotalTask() * 100;
  //   var completedTasks = control.getTotalDoneTask() * 100;
  //   var livetasks = createdTasks - completedTasks;
  //   var precent = (completedTasks / createdTasks * 100).toStringAsFixed(0);
  //   // return LinearGradient(
  //   //   begin: Alignment.centerLeft,
  //   //   end: Alignment.centerRight,
  //   //   colors: [Colors.red, Colors.blue],
  //   // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  //   if (step <= completedTasks)
  //     switch (step) {
  //       case 0:
  //         return Colors.red;
  //       case 1:
  //         return Colors.green;
  //       case 2:
  //         return Colors.blue;
  //       case 3:
  //         return Colors.red;
  //       case 4:
  //         return Colors.green;
  //       case 5:
  //         return Colors.blue;
  //       default:
  //         return Colors.grey;
  //     }
  //   return Colors.grey;

  //   // if (step > completedTasks) return Color.fromRGBO(250, 250, 250, 1);
  //   // return lightcolor.withAlpha(100 - step * 100);
  // }

  Widget progress(Color color, int number, String title, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 3.0.wp,
          width: 3.0.wp,
          decoration: BoxDecoration(
              color: color.withOpacity(0.4),
              shape: BoxShape.circle,
              border: Border.all(
                width: 0.5.wp,
                color: color,
              )),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$number",
              style: mytheme.headline5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: "NoveCentoWide",
                  color: Colors.grey.shade600
                  // color: themecolor(context),
                  // fontWeight: FontWeight.w700
                  ),
            )
          ],
        )
      ],
    );
  }
}
