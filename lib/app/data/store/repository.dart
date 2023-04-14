import 'package:todolist/app/data/provideData/taskProvide.dart';
import 'package:todolist/model/task.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
