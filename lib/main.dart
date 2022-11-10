import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/data/count_data.dart';
import 'package:flutter_youtube1/repository/count_data_dao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  CountDataDao _countDataDao = CountDataDao();
  late StreamProvider _streamProvider;

  @override
  void initState() {
    _streamProvider = StreamProvider<List<CountData>>((ref) => _countDataDao
        .getSnapShot()
        .map((event) =>
            event.docs.map((data) => _convert(data.data())).toList()));
    super.initState();
  }

  CountData _convert(Object? obj) {
    if (obj == null) return CountData(dateTime: DateTime.now(), count: -1);
    return CountData.fromJson(obj as Map<String, dynamic>);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    CountData countData = CountData(dateTime: DateTime.now(), count: _counter);
    _countDataDao.saveCountData(countData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            Consumer(builder: (context, ref, child) {
              final provider = ref.watch(_streamProvider);
              return provider.when(
                  data: (data) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        CountData countData = data[index];
                        return ListTile(
                          title: Text('${countData.dateTime}'),
                          trailing: Text('${countData.count}'),
                        );
                      },
                    );
                  },
                  error: ((error, stackTrace) => Text('Error: $error')),
                  loading: () => const CircularProgressIndicator());
            })
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
