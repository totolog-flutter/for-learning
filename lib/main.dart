import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion (int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _questionIndex ++;
    });
  }
  static const questions = [
    {'questionText': '今日の夕飯は何ですか', 'answers': [{'text': 'カレーライス', 'score': 10}, {'text': 'ハンバーグ', 'score': 5}]},
    {'questionText': '明日は何時に起きますか', 'answers': [{'text':'6:00', 'score': 10}, {'text':'7:00', 'score': 6}, {'text':'8:00', 'score': 4}]},
    {'questionText': '最近、仕事は楽しいですか', 'answers': [{'text':'はい', 'score': 10}, {'text':'いいえ', 'score': 5}]}
  ];
  // final questions = const [
  //   {'questionText': '今日の夕飯は何ですか', 'answers': ['カレーライス', 'ハンバーグ']},
  //   {'questionText': '明日は何時に起きますか', 'answers': ['6:00', '7:00', '8:00']},
  //   {'questionText': '最近、仕事は楽しいですか', 'answers': ['はい', 'いいえ', '8:00']}
  // ];

  void _resetQyuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('quiz app'),
      ),
      body: _questionIndex < questions.length ? Column(children: [
        Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: questions)
      ]) : Result(_totalScore, _resetQyuiz ),
    ));
  }
}