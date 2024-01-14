import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiempo_tracker/utils/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopWatch;
  late Timer t;
  String imgSrc =
      "https://images.unsplash.com/photo-1614292253389-bd2c1f89cd0e?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  @override
  void initState() {
    // TODO: implement initState

    stopWatch = Stopwatch();
    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });

    super.initState();
  }

  void handleStartStop() {
    setState(() {
      debugPrint("Button clicked");
    });
    if (stopWatch.isRunning) {
      stopWatch.stop();
    } else {
      stopWatch.start();
    }
  }

  void resetButtonClicked() {
    if (stopWatch.isRunning) {
      stopWatch.reset();
      stopWatch.stop();
    } else {
      stopWatch.reset();
    }
  }

  String returnFormattedText() {
    var milli = stopWatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    milli = milli.floor();
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgSrc),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tiempo",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 194, 53, 53),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Tracker",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 8,
                    color: const Color.fromARGB(255, 194, 53, 53),
                  ),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Center(
                  child: Text(
                    returnFormattedText(),
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 194, 53, 53)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    onButtonPressed: handleStartStop,
                    buttonColor: Colors.transparent,
                    icons: stopWatch.isRunning ? Icons.pause : Icons.play_arrow,
                  ),
                  MyButton(
                    onButtonPressed: resetButtonClicked,
                    buttonColor: Colors.transparent,
                    icons: Icons.restart_alt_rounded,
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    ]);
  }
}
