import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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

class _PlayingSoundStfulState extends State<PlayingSoundStful> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/background_vectors.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
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
            onTap: () {
              isPause = !isPause;
              setState(() {});
            },
            child: Image.asset(
              isPause ? "assets/pause_btn.png" : "assets/play_btn.png",
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
                // color: Colors.yellow,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset("assets/back_btn.png"))),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Session 1",
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
                      "10 minutes",
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
      ],
    );
  }
}
