import 'package:flutter/material.dart';
import './schemas/schema.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    late Realm realm;
    List<SchemaObject> schemaObjects = [Member.schema, Department.schema];
    final config = Configuration.local(schemaObjects);
    realm = Realm(config);
    // print('realmPath: ${config.path}');
    final department = Department(ObjectId(), 'develop');
    final member = Member(ObjectId(), 'Hana Kojima', 'hana.kojima@sample.com');
    department.members.add(member);
    realm.write(() => realm.add(department));
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
