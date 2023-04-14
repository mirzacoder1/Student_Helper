import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_helper/providers/chats_provider.dart';
import 'package:student_helper/providers/models_provider.dart';
import 'package:student_helper/screens/chat_screen.dart';
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          ),
        home: const ChatScreen(),
      ),
    );
  }
}
