import 'dart:convert';

import 'package:get/get.dart';
import 'package:todolist/app/data/store/sevices.dart';
import 'package:todolist/model/task.dart';

//Task管理
class TaskProvider {
  final _store = Get.find<StoreService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    dynamic temp = jsonDecode(_store.read("tasks").toString());
    print("before Provider = ${jsonDecode(_store.read("tasks").toString())}");
    for (var e in temp) {
      tasks.add(Task.fromjson(e));
    }

    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    var temp = <dynamic>[];
    for (var e in tasks) {
      temp.add(jsonEncode(e.tojson(e)));
    }

    _store.write("tasks", temp);
  }
}
