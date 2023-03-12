import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_helper/providers/chats_provider.dart';
import 'package:student_helper/providers/models_provider.dart';
import 'chat_screen.dart';

class chatApp extends StatelessWidget {
  const chatApp({super.key});

  // This widget is the root of your application.
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
