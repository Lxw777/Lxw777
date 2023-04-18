import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/constValue/store_key.dart';
import 'package:todolist/app/data/store/sevices.dart';

//深色模式状态
class DarkThemeProvider extends ChangeNotifier {
  final _store = Get.find<StoreService>();

  int _themeMode = 0;
  int get themeMode => _themeMode;
  DarkThemeProvider() {
    _themeMode = _store.read(StoreConst.ThemeMode) ?? 0;
    notifyListeners();
  }

  ThemeMode readMode() {
    int _themeMode = _store.read(StoreConst.ThemeMode) ?? 0;
    if (_themeMode == 0)
      return ThemeMode.system;
    else if (_themeMode == 1)
      return ThemeMode.light;
    else
      return ThemeMode.dark;
  }

  void writeMode(int mode) {
    _themeMode = mode;
    _store.write(StoreConst.ThemeMode, _themeMode);

    notifyListeners();
  }

  final lightTheme = ThemeData(
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      )),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: lightcolor, fontSize: 20),
          color: Colors.white,
          iconTheme: IconThemeData(color: lightcolor)),
      colorScheme: ColorScheme.light().copyWith(primary: lightcolor),
      primaryColor: lightcolor,

      // ignore: prefer_const_constructors
      textTheme: mytheme);
  final darkTheme = ThemeData(
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      )),
      // colorScheme: ColorScheme.light().copyWith(primary: lightcolor),
      primaryColor: darkcolor,

      // ignore: prefer_const_constructors
      textTheme: mytheme);
}
