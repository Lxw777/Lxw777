import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/const/colors.dart';
import 'package:todolist/app/const/extensions.dart';
import 'package:todolist/app/const/theme.dart';
import 'package:todolist/app/widgets/myApplication.dart';
import 'package:todolist/controller/introController.dart';

import '../../main.dart';

class Intro extends StatelessWidget {
  Intro({Key? key}) : super(key: key);
  final introdata = IntroController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Color.fromARGB(49, 49, 49, 1)
          : Color(0xffF8F2F1),
      body: Stack(children: [
        SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  controller: introdata.pagecontroller,
                  onPageChanged: introdata.currentIndex,
                  itemCount: introdata.contents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 35, left: 25, right: 25, bottom: 25),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image(
                              image: AssetImage(
                                  introdata.contents[index].imageName ?? ""),
                              // width: MediaQuery.of(context).size.width,
                              height: 340,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10.0.hp,
                          ),
                          Text(
                            introdata.contents[index].title ?? "",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Text(
                            introdata.contents[index].description ?? "",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(introdata.contents.length, (index) {
                      return Obx(() {
                        return Container(
                          height: 15,
                          width:
                              introdata.currentIndex.value == index ? 55 : 30,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 7,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: introdata.currentIndex.value == index
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                          ),
                        );
                      });
                    }),
                  ),
                ),
                SizedBox(
                  height: 10.0.hp,
                ),
                Obx(() {
                  return Container(
                    // color: themecolor(context),
                    padding: EdgeInsets.only(bottom: 30),
                    width: 60.0.wp,
                    height: 10.0.hp,
                    child: ElevatedButton(
                      onPressed: () {
                        introdata.actionbutton();
                      },
                      child: Text(
                        introdata.currentIndex.value ==
                                introdata.contents.length - 1
                            ? "开始使用"
                            : "下一页",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(themecolor(context)),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        Positioned(
            right: 1,
            top: MediaQuery.of(context).padding.top,
            child: TextButton(
              onPressed: () {
                preferences!.setBool("intro", true);
                Get.off(() => MyApplication());
              },
              child: Text(
                "跳过",
                style: mytheme.headline2,
              ),
            ))
      ]),
    );
  }
}
