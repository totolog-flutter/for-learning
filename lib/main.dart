import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✋';
  String computerHand = '✋';
  String result = '引き分け';
  List<String> handType = ["✊", "✌️", "✋"];

  void _changeMyHand(String hand) {
    setState(() {
      myHand = hand;
      _computedHand();
      _judge();
    });
  }

  void _computedHand() {
    int computerNum = Random().nextInt(3);
    computerHand = handType[computerNum];
  }

  void _judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                computerHand,
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                myHand,
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _changeMyHand('✊');
                    },
                    child: Text('✊'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _changeMyHand('✌️');
                    },
                    child: Text('✌️'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _changeMyHand('✋');
                    },
                    child: Text('✋'),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
