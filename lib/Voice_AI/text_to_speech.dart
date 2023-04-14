import 'package:flutter/material.dart';
import 'package:student_helper/Voice_AI/tts.dart';

class TTSpeech extends StatelessWidget {
  const TTSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Voice Assistant..."),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
          ),
          ElevatedButton(
            onPressed: () {
              TextToSpeech.speak(textController.text);
            },
            child: const Text("Speak"),
          ),
        ],
      ),
    );
  }
}
