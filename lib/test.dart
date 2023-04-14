import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              ExpansionPanelList(
                children: <ExpansionPanel>[
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('我是标题'),
                      );
                    },
                    body: ListBody(
                      children: <Widget>[
                        DatePickerDialog(
                          initialCalendarMode: DatePickerMode.day,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        ),
                      ],
                    ),
                    isExpanded: _isExpanded,
                    canTapOnHeader: true,
                  ),
                ],
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _isExpanded = !isExpanded;
                  });
                },
                animationDuration: kThemeAnimationDuration,
              ),
            ],
          ),
        )
        // 考勤日历
        //   DatePickerDialog(
        // initialDate: DateTime.now(),
        // firstDate: DateTime.now(),
        // lastDate: DateTime(2025),
        // onDateChanged: onDateChanged,),
        // // 0：无状态，1：正常考勤  2：异常考情，迟到，早退，
        // // 若不满一个月，日历会自动用0补满一个月
        // checking: [
        //   0,
        //   0,
        //   1,
        //   2,
        // ],

        );
  }
}
