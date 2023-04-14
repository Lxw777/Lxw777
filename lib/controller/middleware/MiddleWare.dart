import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/main.dart';

//引导
class IntroMeddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (preferences!.getBool("intro") != null)
      return RouteSettings(name: '/Demo');
  }
}
