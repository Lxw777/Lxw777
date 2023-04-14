import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/data/store/sevices.dart';

//深色模式状态
class DarkThemeProvider extends ChangeNotifier {
  final _store = Get.find<StoreService>();

  bool _isDark = false;
  bool get isDark => _isDark;
  bool _followSystem = true;
  bool get followSystem => _followSystem;

  late ThemeData _themeData;
  ThemeData get themedata => _themeData;

  bool readDark() {
    var isdark = _store.read("dark");
    return isdark ?? false;
  }

  void writeDark(bool isdark) {
    _store.writebool("dark", isdark);
  }

  bool readFollow() {
    var isFollow = _store.read("follow");
    return isFollow ?? true;
  }

  void writeFollow(bool isFollow) {
    _store.writebool("follow", isFollow);
  }

  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      )),
      colorScheme: ColorScheme.light().copyWith(primary: lightcolor),
      primaryColor: lightcolor,

      // ignore: prefer_const_constructors
      textTheme: mytheme);
  ThemeData darkTheme = ThemeData(
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

  //初始化
  DarkThemeProvider() {
    _isDark = readDark();
    _followSystem = readFollow();
    _themeData = readDark() ? darkTheme : lightTheme;
    notifyListeners();
  }
  void switchTheme(bool isDark) {
    _isDark = isDark;
    writeDark(isDark);
    _themeData = isDark ? darkTheme : lightTheme;
    notifyListeners();
  }

  void pressFollow() {
    _followSystem = !_followSystem;
    writeFollow(_followSystem);
    notifyListeners();
  }
}
