import 'package:deep_sleep_music/gsheets.dart';
import 'package:deep_sleep_music/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'globalVars.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

Future basicTasks() async {
  List parallelFutures = await Future.wait([gsheetss(), updateDeviceDetails()]);
  allSounds = parallelFutures[0];
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    basicTasks().then((value) {
      // allSounds = value;
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F143C),
      body: Stack(
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
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/app-icon-rounded.png",
                width: 175,
              ),
            ),
          )
        ],
      ),
    );
  }
}
