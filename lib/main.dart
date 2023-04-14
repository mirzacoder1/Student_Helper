// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:student_helper/Voice_AI/text_to_speech.dart';
import 'package:student_helper/Voice_AI/tts.dart';
import 'package:student_helper/screens/homePage.dart';
// import 'package:student_helper/screens/speech_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  TextToSpeech.initTTS();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()/* AnimatedSplashScreen(
          splash: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDx0r_CWdry4br1C2vVdxENTUmVEZWZusVuaBuQcIxGw&s",
            fit: BoxFit.contain,
            width: 2000.0,
            height: 2000.0,
          ),
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: HomeScreen()),
          // nextScreen: SpeechScreen()),
          // nextScreen: TTSpeech()),
          // nextScreen: MyApp()), */

    );
  }
}
