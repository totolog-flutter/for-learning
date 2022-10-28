import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({super.key});

  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center
      ),
    );
  }
}