import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import "globalVars.dart";
import 'package:just_audio/just_audio.dart';
import 'package:in_app_review/in_app_review.dart';

class PlayingSound extends StatelessWidget {
  const PlayingSound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F143C),
      body: PlayingSoundStful(),
    );
  }
}

class PlayingSoundStful extends StatefulWidget {
  const PlayingSoundStful({super.key});

  @override
  State<PlayingSoundStful> createState() => _PlayingSoundStfulState();
}

bool isPause = false;
AudioPlayer myAudioPlayer = new AudioPlayer();
Timer? t;

class _PlayingSoundStfulState extends State<PlayingSoundStful> {
  @override
  void initState() {
    super.initState();
    myAudioPlayer.setUrl(finalSongUrl!);
    myAudioPlayer.play();
    // timedTurnOff(3);
  }

  @override
  void dispose() async {
    isPause = false;
    try {
      myAudioPlayer.stop();
    } catch (e) {
      print("error player audio stop:$e");
    }
    try {
      cupertinoScrollController.dispose();
    } catch (e) {
      print("error cupertino dispose:$e");
    }
    final InAppReview inAppReview = InAppReview.instance;
    super.dispose();
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    void timedTurnOff(index) {
      if ((t != null) && (t!.isActive)) {
        t!.cancel();
        isPause = true;
        setState(() {});
      }

      t = Timer(Duration(seconds: alltimes[index][1]), () {
        myAudioPlayer.pause();
      });
    }

    Widget buildPicker() => SizedBox(
          height: 300,
          child: CupertinoPicker(
              itemExtent: 50,
              useMagnifier: true,
              magnification: 1.1,
              scrollController: cupertinoScrollController,
              onSelectedItemChanged: (index) {
                HapticFeedback.mediumImpact();
                userSelectedIndex = index;
                setState(() {});
                timedTurnOff(index);
              },
              children: [
                ...List.generate(alltimes.length, (index) {
                  return Center(child: cupTxt(alltimes[index][0]));
                }),
              ]),
        );

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/background_vectors.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/background_centered_items.png",
            width: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () async {
              if (isPause) {
                myAudioPlayer.play();
              } else {
                myAudioPlayer.pause();
              }
              isPause = !isPause;
              setState(() {});
            },
            child: Image.asset(
              isPause ? "assets/play_btn.png" : "assets/pause_btn.png",
              width: 75,
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/back_btn.png",
                              width: 40,
                            ))),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Session ${indexx! + 1}",
                        style: TextStyle(
                          color: Color(0xffBCB5E5),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print("clicked");
                  cupertinoScrollController.dispose();
                  cupertinoScrollController = FixedExtentScrollController(
                      initialItem: userSelectedIndex);
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            actions: [
                              buildPicker(),
                            ],
                          ));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffD6D3E6),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        alltimes[userSelectedIndex][0],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/drop_down.png",
                          width: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

int userSelectedIndex = 3;
var cupertinoScrollController =
    FixedExtentScrollController(initialItem: userSelectedIndex);
List alltimes = [
  ["10 minutes", 10 * 60],
  ["30 minutes", 30 * 60],
  ["1 hour", 1 * 60 * 60],
  ["Unlimited", 24 * 60 * 60]
];
Text cupTxt(String txt) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 24,
    ),
  );
}
