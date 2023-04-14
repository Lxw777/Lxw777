import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  State<DayView> createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            // top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    // AnimatedBtn(
                    //   btnAnimationController: _btnAnimationController,
                    //   press: () {
                    //     _btnAnimationController.isActive = true;

                    //     Future.delayed(
                    //       const Duration(milliseconds: 800),
                    //       () {
                    //         setState(() {
                    //           isShowSignInDialog = true;
                    //         });
                    //         showCustomDialog(
                    //           context,
                    //           onValue: (_) {
                    //             setState(() {
                    //               isShowSignInDialog = false;
                    //             });
                    //           },
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       //约束性盒子
    //       Image.asset('assets/Spline.png'),
    //       RiveAnimation.asset('assets/shapes.riv'),
    //       Center(
    //         //可裁切的矩形
    //         child: ClipRect(
    //           //背景过滤器
    //           child: BackdropFilter(
    //             filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 10.0),
    //             child: Opacity(
    //               opacity: 0.2,
    //               child: Container(
    //                 width: 500.0,
    //                 height: 700.0,
    //                 decoration: BoxDecoration(color: Colors.grey.shade200),
    //                 child: Center(
    //                   child: Text(
    //                     "天河区扛把子",
    //                     style: TextStyle(fontSize: 40, color: Colors.black),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
