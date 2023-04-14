import 'package:get/get.dart';
import 'package:todolist/app/data/provideData/taskProvide.dart';
import 'package:todolist/app/data/store/repository.dart';
import 'package:todolist/controller/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Homecontroller(
        taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }
}
