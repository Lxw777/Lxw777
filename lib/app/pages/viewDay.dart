import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  State<DayView> createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  late bool play;

  @override
  void initState() {
    super.initState();
    play = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 300,
                child: play
                    ? RiveAnimation.asset(
                        "assets/done.riv",
                        animations: ["done 2"],
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                      )),
          ),
          Container(
            height: 100,
            width: 100,
            child: TextButton(
              onPressed: () {
                setState(() => play = !play);
                // _controller.isActive = true;
              },
              // tooltip: 'Play',
              child: const Icon(Icons.arrow_upward),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   // disable the button while playing the animation
      //   onPressed: () => _isPlaying ? null : _controller.isActive = true,
      //   tooltip: 'Play',
      //   child: const Icon(Icons.arrow_upward),
      // ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   bool _isPlaying;
  //   RiveAnimationController _controller = OneShotAnimation(
  //     'State Machine 1',
  //     autoplay: false,
  //     onStop: () => setState(() => _isPlaying = false),
  //     onStart: () => setState(() => _isPlaying = true),
  //   );
  //   ;

  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         RiveAnimation.asset(
  //           "assets/done.riv",
  //           controllers: [_controller],
  //           // Update the play state when the widget's initialized
  //           // onInit: (_) => setState(() {}),
  //         ),
  //       ],
  //     ),
  //   );

  // }
}
