import 'package:flutter/material.dart';
import 'package:todolist/app/const/theme.dart';

// ignore: must_be_immutable
class SwitchPanel extends StatefulWidget {
  List<Widget> widgets;
  List<String> title;
  SwitchPanel({super.key, required this.widgets, required this.title});

  @override
  State<SwitchPanel> createState() => _SwitchPanelState();
}

class _SwitchPanelState extends State<SwitchPanel> {
  late int select;
  String _currentMenuItem = "";
  @override
  void initState() {
    select = 0;
    _currentMenuItem = widget.title[select];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(_currentMenuItem),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Container(
                    child: Text(
                      widget.title[0],
                      style: mytheme.headline2,
                    ),
                    padding: EdgeInsets.all(3),
                  ),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Container(
                    child: Text(
                      widget.title[1],
                      style: mytheme.headline2,
                    ),
                    padding: EdgeInsets.all(3),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Container(
                    child: Text(
                      widget.title[2],
                      style: mytheme.headline2,
                    ),
                    padding: EdgeInsets.all(3),
                  ),
                  value: 2,
                ),
              ],
              onSelected: (value) {
                // 更新_selectedComponent变量
                setState(() {
                  select = value;
                });
              },
            ),
          ],
        ),
        // 根据_selectedComponent变量来渲染不同的组件
        widget.widgets[select]
        // switchWidget(select)
      ],
    );
  }

  // Widget switchWidget(int s) {
  //   switch (s) {
  //     case 0:
  //       return Container(
  //         color: Colors.green,
  //         height: 100,
  //         width: 100,
  //       );
  //     case 1:
  //       return Container(
  //         color: Colors.red,
  //         height: 100,
  //         width: 100,
  //       );
  //     default:
  //       return Container(
  //         color: Colors.green,
  //         height: 100,
  //         width: 100,
  //       );
  //   }
  // }
}
