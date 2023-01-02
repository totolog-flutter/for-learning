import 'package:flutter/material.dart';
import 'package:flutter_youtube1/controllers/main.controller.dart';
import 'package:flutter_youtube1/service/realm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    RealmService.realmInstance.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MainController mainController = MainController();
  int _counter = 0;

  @override
  void initState() {
    mainController.getMembers();
    super.initState();
  }

  void _addMember() {
    setState(() {
      _counter++;
    });
    mainController.addMember(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realm sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMember,
        tooltip: 'AddMember',
        child: const Icon(Icons.add),
      ),
    );
  }
}
