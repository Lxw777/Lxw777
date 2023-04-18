import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/data/provideData/darkThemeProvider.dart';

class DarkModePage extends StatefulWidget {
  const DarkModePage({super.key});

  @override
  State<DarkModePage> createState() => _DarkModePageState();
}

class _DarkModePageState extends State<DarkModePage> {
  @override
  Widget build(BuildContext context) {
    int selected =
        Provider.of<DarkThemeProvider>(context, listen: false).themeMode;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: themecolor(context)),
      ),
      body: Container(
        child: Column(children: [
          // TextButton(
          //     onPressed: () {
          //       Provider.of<DarkThemeProvider>(context, listen: false)
          //           .writeMode(1);
          //     },
          //     child: Text("12")),
          Container(
            color: 0 == selected ? themecolor(context) : null,
            child: ListTile(
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                    Provider.of<DarkThemeProvider>(context, listen: false)
                        .writeMode(0);
                  });
                },
                child: Text("跟随系统", style: mytheme.headline2),
              ),
              leading: Icon(Icons.abc),
            ),
          ),
          Container(
            color: 1 == selected ? themecolor(context) : null,
            child: ListTile(
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                    Provider.of<DarkThemeProvider>(context, listen: false)
                        .writeMode(1);
                  });
                },
                child: Text("浅色模式", style: mytheme.headline2),
              ),
              leading: Icon(Icons.abc),
            ),
          ),
          Container(
            color: 2 == selected ? themecolor(context) : null,
            child: ListTile(
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                    Provider.of<DarkThemeProvider>(context, listen: false)
                        .writeMode(2);
                  });
                },
                child: Text("深色模式", style: mytheme.headline2),
              ),
              leading: Icon(Icons.abc),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget themeList(int index, String mode, Icon icon, BuildContext context) {
  int selected =
      Provider.of<DarkThemeProvider>(context, listen: false).themeMode;
  return Container(
    color: index == selected ? themecolor(context) : null,
    child: ListTile(
      title: GestureDetector(
        onTap: () {
          selected = index;
          Provider.of<DarkThemeProvider>(context, listen: false)
              .writeMode(index);
        },
        child: Text(mode, style: mytheme.headline2),
      ),
      leading: icon,
    ),
  );
}
