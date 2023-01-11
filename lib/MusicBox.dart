import 'package:deep_sleep_music/playingSound.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MusicBox extends StatelessWidget {
  const MusicBox({super.key, required this.index, required this.new1});
  final int index;
  final int new1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/design$new1.png"))),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Text(
                  "SESSION",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  print("clicked more options");
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.white.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => PlayingSound(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/playBtn.png",
                    width: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
