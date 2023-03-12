import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:student_helper/screens/homePage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDx0r_CWdry4br1C2vVdxENTUmVEZWZusVuaBuQcIxGw&s",
            height: 200,
            width: 200,
          ),
          nextScreen: HomeScreen()),
    );
  }
}
