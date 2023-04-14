import 'package:flutter/material.dart';

class detailScreen extends StatelessWidget {
  const detailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://cdn.codechef.com/sites/default/files/uploads/pictures/38a64b4569cb6cbbdfc6fb8ea101ffec.jpeg";
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
          Image.asset(
              "$imageUrl",
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}