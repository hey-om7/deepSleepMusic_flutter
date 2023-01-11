import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'MusicBox.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F143C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.width * 0.8853333333,
              width: double.infinity,
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/backgroundDesign.png",
                        // width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/beginBtn.png",
                          width: 120,
                          height: 37,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/share.png",
                          width: 34,
                          height: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Deep Sleep",
                    style: TextStyle(
                      color: Color(0xffE4DFFE),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Relax your body by getting it into a deep sleep with these mind soothing ambient tones.",
                    style: TextStyle(
                      color: Color(0xffA2A2CB),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "SLEEP MUSIC",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffB5B4D7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  ...List.generate(20, (index) {
                    int _new1 = index % 4 + 1;
                    return MusicBox(
                      new1: _new1,
                      index: index,
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
