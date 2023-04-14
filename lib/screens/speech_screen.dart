import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:student_helper/Voice_AI/api_services.dart';
import 'package:student_helper/Voice_AI/tts.dart';
import 'package:student_helper/constants/constants.dart';
import 'package:student_helper/models/chat_model.dart';
import 'package:student_helper/screens/homePage.dart';
import 'package:student_helper/widgets/chat_bubble.dart';


class SpeechScreen extends StatefulWidget {
/*   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  TextToSpeech.initTTS; */

  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold The Button and Start Speaking!!!";
  var isListening = false;

  var scrollController = ScrollController();

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  final List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.cyan,
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                    });
                  });
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            await speechToText.stop();

            if (text.isNotEmpty &&
                text != "Hold The Button and Start Speaking!!!") {
              messages.add(ChatMessage(text: text, type: ChatMessageType.user));
              var msg = await ApiServices.sendMessage(text);
              msg = msg.trim();

              setState(() {
                messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
              });

              Future.delayed(Duration(milliseconds: 500), () {
                TextToSpeech.speak(msg);
              });
            } 
            /* else if (text == "who is Javed Alam") {
              messages.add(ChatMessage(text: text, type: ChatMessageType.user));
              var msg = "Javed Alam is a teacher in  MSI Inter College, Buxipur.This Teacher is one of the best educators I have ever met. Love You Sir very much, this app is mainly dedicated to you";
              msg = msg.trim();
              setState(() {
                messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
              });

              Future.delayed(Duration(milliseconds: 500), () {
                TextToSpeech.speak(msg);
              });
              
            } */
            else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Failed to process, try again"),
              ));
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.cyan,
            radius: 35,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: cardColor,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        elevation: 2.0,
        title: Text(
          "Voice Assistant...",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: cardColor,
          ),
        ),
      ),
      /* SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Container( */
      body: Container(
        /* width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 10), */

        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 19.5,
                  color: isListening ? Colors.black87 : Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: chatBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, index) {
                        var chat = messages[index];
                        return ChatBubble(chatText: chat.text, type: chat.type);
                      })),
            ),
            const SizedBox(height: 12),
            Text(
              "Developed By Mrza Zabbar Yunus",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
