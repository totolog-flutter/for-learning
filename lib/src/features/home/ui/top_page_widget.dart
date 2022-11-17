import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/sample/ui/sample_page_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(children: [
        ElevatedButton(
          child: const Text('サンプル画面へ'),
          onPressed: () =>
              Navigator.of(context).pushNamed(SamplePage.routeName),
        ),
      ]),
    );
  }
}
