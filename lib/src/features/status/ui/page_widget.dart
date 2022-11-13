import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatusPage'),
        backgroundColor: Colors.redAccent, // わかりやすいように色付け
      ),
    );
  }
}
