import 'package:deep_sleep_music/home.dart';
import 'package:deep_sleep_music/logo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff0F143C),
        body: Logo(),
      ),
    );
  }
}
