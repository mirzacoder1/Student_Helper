import 'package:flutter/material.dart';
import 'package:student_helper/constants/constants.dart';
import 'package:student_helper/models/chat_model.dart';

Widget ChatBubble({required chatText, required ChatMessageType? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: bgColor,
        child: Type == ChatMessageType.bot
            ? Image.asset('assets/chat_logo.png')
            : Icon(Icons.person),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: type == ChatMessageType.bot ? bgColor : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Text(
            "$chatText",
            style: TextStyle(
                color: type == ChatMessageType.bot
                    ? scaffoldBackgroundColor
                    : chatBgColor,
                fontSize: 15,
                fontWeight: type == ChatMessageType.bot
                    ? FontWeight.w600
                    : FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}
