import 'package:flutter/material.dart';
import 'package:flutter_youtube1/src/features/home/ui/top_page_widget.dart';
import 'package:flutter_youtube1/src/features/sample/ui/sample_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        SamplePage.routeName: (context) => SamplePage(),
      },
    );
  }
}
