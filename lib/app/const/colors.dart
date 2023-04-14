import 'package:flutter/material.dart';

//颜色
const purple = Color(0xFF756BFC);
const pink = Color(0xFFF1A39A);
const deepPink = Color(0xFFFA63C6);
const green = Color(0xFF41CF9F);
const yellow = Color(0xFFEEC38E);
const lightBlue = Color(0xFF42A5F5);
const blue = Color(0xFF2860E6);
const deepblue = Color.fromRGBO(32, 19, 219, 1);
const white = Colors.white;
const black = Colors.black;

//主题色 明/暗
// const lightcolor = Color(0xfa709a);
const lightcolor = Color(0xFFF5905D);
// const lightcolor = Color.fromRGBO(32, 19, 219, 1);
const darkcolor = Color.fromARGB(167, 30, 145, 165);

Color themecolor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? darkcolor
      : lightcolor;
}
