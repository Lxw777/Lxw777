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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: themecolor(context)),
      ),
      body: Container(
        child: Column(children: [
          ListTile(
            title: InkWell(
              onTap: () {
                Provider.of<DarkThemeProvider>(context, listen: false)
                    .pressFollow();
              },
              child: Text("深色模式", style: mytheme.headline2),
            ),
            leading: Theme.of(context).brightness == Brightness.light
                ? Icon(Icons.brightness_5)
                : Icon(Icons.brightness_2),
            trailing: Provider.of<DarkThemeProvider>(
              context,
            ).followSystem
                ? Text("跟随系统")
                : CupertinoSwitch(
                    value:
                        Provider.of<DarkThemeProvider>(context, listen: false)
                            .isDark,
                    onChanged: (value) {
                      Provider.of<DarkThemeProvider>(context, listen: false)
                          .switchTheme(value);
                    }),
          ),
        ]),
      ),
    );
  }
}
