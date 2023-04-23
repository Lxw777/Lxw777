import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/constValue/store_key.dart';
import 'package:todolist/app/data/store/sevices.dart';

//Task管理
class CheckInProvider extends ChangeNotifier {
  final _store = Get.find<StoreService>();

  Map<DateTime, int> readMap() {
    // Map<DateTime, int> checkin;
    // checkin = _store.read(StoreConst.CheckIn) ?? {};

    // return checkin;

    List<dynamic> dateTimes = _store.read(StoreConst.Date) ?? [];
    List<dynamic> values = _store.read(StoreConst.Degree) ?? [];
    if (dateTimes.length != values.length) {
      return {};
    }
    Map<DateTime, int> data = {};
    for (int i = 0; i < dateTimes.length; i++) {
      data[DateTime.parse(dateTimes[i])] = values[i];
    }
    return data;
  }

  void writeMap(String s, {int degree = 1}) {
    Map<DateTime, int> checkin = {};
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month > 10
        ? DateTime.now().month.toString()
        : "0" + DateTime.now().month.toString();
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') {
        String day = i >= 10 ? i.toString() : "0" + i.toString();
        checkin[DateTime.parse(year + month + day)] = degree;
      }
    }
    List<String> dateTimes = checkin.keys.map((e) => e.toString()).toList();
    List<int> values = checkin.values.toList();
    _store.writeList(StoreConst.Date, dateTimes);
    _store.writeList(StoreConst.Degree, values);

    notifyListeners();
  }
}
