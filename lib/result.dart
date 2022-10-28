import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback handleReset;
  const Result(this.totalScore, this.handleReset);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 10) {
      resultText = 'あなたは何もわかっていない。やり直し....';
    } else if (totalScore <= 12) {
      resultText = 'いい感じ';
    } else if (totalScore <= 15) {
      resultText = 'お！すごいじゃん！';
    } else {
      resultText = 'おおお！めちゃくちゃすごい';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('もう一度'), onPressed: handleReset)
      ],
    ));
  }
}