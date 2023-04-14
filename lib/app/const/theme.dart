import 'package:flutter/material.dart';

import 'colors.dart';

// //字体主题
// final mytheme = TextTheme(
//   // displayLarge: const TextStyle(
//   //     fontSize: 15,
//   //     fontFamily: "Ubuntu-Medium.ttf",
//   //     fontWeight: FontWeight.w900),
//   headline1: const TextStyle(
//     fontSize: 32,
//     fontFamily: "Ubuntu-Medium.ttf",
//   ),
//   headline2: const TextStyle(
//     fontSize: 17,
//     fontFamily: "Ubuntu-Regular.ttf",
//   ),
//   headline3: const TextStyle(
//       fontSize: 24, fontFamily: "Ubuntu-Medium.ttf", color: white),
//   headline4: const TextStyle(
//       fontSize: 36,
//       fontFamily: "Ubuntu-Medium.ttf",
//       // color: Colors.black,
//       fontWeight: FontWeight.w500),
//   headline5: const TextStyle(
//       fontSize: 24,
//       fontFamily: "Ubuntu-Medium.ttf",
//       // color: Colors.black,
//       overflow: TextOverflow.ellipsis,
//       fontWeight: FontWeight.w500),
//   button: const TextStyle(
//       fontSize: 25, fontFamily: "Ubuntu-Medium.ttf", color: lightcolor),
//   headline6: const TextStyle(
//       fontSize: 25,
//       fontFamily: "Ubuntu-Medium.ttf",
//       color: black,
//       fontWeight: FontWeight.w400),
// ).apply(fontFamily: "Ubuntu");

final mytheme = TextTheme(
  headline1: const TextStyle(
    fontSize: 32,
    fontFamily: "MiSans-Medium.ttf",
  ),
  headline2: const TextStyle(
    fontSize: 17,
    fontFamily: "MiSans-Regular.ttf",
  ),
  headline3: const TextStyle(
    fontSize: 24,
    fontFamily: "MiSans-Medium.ttf",
    color: white,
  ),
  headline4: const TextStyle(
      fontSize: 36,
      fontFamily: "MiSans-Medium.ttf",
      // color: Colors.black,
      fontWeight: FontWeight.w500),
  headline5: const TextStyle(
      fontSize: 24,
      fontFamily: "MiSans-Medium.ttf",
      // color: Colors.black,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500),
  button: const TextStyle(
      fontSize: 25, fontFamily: "MiSans-Medium.ttf", color: lightcolor),
  headline6: const TextStyle(
      fontSize: 25,
      fontFamily: "MiSans-Medium.ttf",
      color: black,
      fontWeight: FontWeight.w400),
).apply(fontFamily: "MiSans");

// TextStyle NoveCentoWide(double size, {Color? color, BuildContext? context}) {
//   return TextStyle(
//       fontSize: size,
//       fontFamily: "NoveCentoWide",
//       color: color ?? themecolor(context!),
//       fontWeight: FontWeight.w500);
// }
