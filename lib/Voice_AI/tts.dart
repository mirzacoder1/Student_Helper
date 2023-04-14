import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() {
    tts.setLanguage("hi-IN");
    tts.setPitch(1.0);
    tts.setSpeechRate(0.5);
  }

  static speak(String? text) async {
    tts.setStartHandler(
      () {
        print("TTS has Started");
      },
    );
    tts.setCompletionHandler(() {
      print("Completed");
    });
    tts.setErrorHandler((message) {
      print(message);
    });
    await tts.awaitSpeakCompletion(true);
    tts.speak("$text");
  }
}
