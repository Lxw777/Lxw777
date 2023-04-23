import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:todolist/app/constValue/colors.dart';

class CheckIn extends StatefulWidget {
  final createdTasks;
  final precent;
  // const CheckIn({super.key});

  const CheckIn({super.key, required this.createdTasks, required this.precent});
  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  bool isplay = false;
  String animation = "done";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isplay = !isplay;
          });
          // animation = "done 2";
        },
        child: isplay
            ? Container(
                color: Colors.transparent,
                child: RiveAnimation.asset(
                  'assets/done.riv',
                  animations: ["done"],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.createdTasks == 0 ? 0 : widget.precent} %',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 1.0,
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
              ));
  }
}
