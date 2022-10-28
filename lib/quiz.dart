import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(int) answerQuestion;
  // final VoidCallback answerQuestion;
  const Quiz({
    required this.answerQuestion,
    required this.questionIndex,
    required this.questions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) => Answer(selectHandler: () => answerQuestion(answer['score'] as int), answerText: (answer['text'] as String))).toList()
      ]);
  }
}