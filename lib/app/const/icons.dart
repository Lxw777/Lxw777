import 'package:flutter/material.dart';
import 'package:todolist/app/const/colors.dart';

//图标库 https://www.fluttericon.com/

List<Icon> getIcons() {
  return const [
    Icon(
      MyFlutterApp.graduation_cap,
      color: lightBlue,
    ),
    Icon(
      MyFlutterApp.food,
      color: purple,
    ),
    Icon(
      MyFlutterApp.basket,
      color: pink,
    ),
    Icon(
      MyFlutterApp.directions_run,
      color: green,
    ),
    Icon(
      MyFlutterApp.person,
      color: yellow,
    ),
    Icon(
      MyFlutterApp.video,
      color: deepPink,
    ),
  ];
}

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData graduation_cap =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData directions_run =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData video =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData basket =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData progress =
      IconData(0xe830, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData food =
      IconData(0xf0f5, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData check =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
