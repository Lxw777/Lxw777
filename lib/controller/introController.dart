import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:todolist/app/widgets/myApplication.dart';
import 'package:todolist/main.dart';
import 'package:todolist/model/introContent.dart';

class IntroController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pagecontroller = PageController();

  actionbutton() {
    if (currentIndex.value == contents.length - 1) {
      preferences!.setBool("intro", true);
      Get.off(() => MyApplication());
    }
    pagecontroller.nextPage(duration: 800.milliseconds, curve: Curves.ease);
  }

  List<IntroContent> contents = [
    // IntroContent(
    //     imageName: "assets/taking-notes-amico.png",
    //     title: "创建你的任务清单",
    //     description: "创建您的任务清单来确保您的每项任务都能按时完成"),
    // IntroContent(
    //     imageName: "assets/to-do-list-cuate.png",
    //     title: "管理你的任务清单",
    //     description: "通过使用本应用，您将能够管理日常任务"),
    // IntroContent(
    //     imageName: "assets/writing-a-letter-rafiki.png",
    //     title: "勾选完成任务",
    //     description: "如果您完成了任务，那么您可以查看每天工作的结果"),
    // IntroContent(
    //     imageName: "assets/writing-a-letter-rafiki.png",
    //     title: "勾选完成任务",
    //     description: "如果您完成了任务，那么您可以查看每天工作的结果")
    IntroContent(
        imageName: "assets/note.png",
        title: "创建你的任务清单",
        description: "创建您的任务清单来确保您的每项任务都能按时完成"),
    IntroContent(
        imageName: "assets/plan.png",
        title: "管理你的任务清单",
        description: "通过使用本应用，您将能够管理日常任务"),
    IntroContent(
        imageName: "assets/complete.png",
        title: "勾选完成任务",
        description: "如果您完成了任务，那么您可以查看每天工作的结果"),
  ];
}

class sharedprefsintro {}
