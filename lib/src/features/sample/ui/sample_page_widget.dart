import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/sample/controller/sample_provider.dart';
import 'package:flutter_youtube1/src/features/sample/data/register_data.dart';
import 'package:flutter_youtube1/src/features/sample/data/sample_page_data.dart';
import 'package:flutter_youtube1/src/features/sample/ui/register_page_widget.dart';

final samplePageProvider =
    StateNotifierProvider<SamplePageNotifier, SamplePageData>((ref) {
  return SamplePageNotifier();
});

class SamplePage extends ConsumerWidget {
  static const routeName = '/sample';
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final samplePageState = ref.watch(samplePageProvider);
    final List<Register> recordList = ref.watch(samplePageProvider
            .select((value) => value.recordList as List<Register>)) ??
        [];
    final samplePageNotifier = ref.read(samplePageProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('押された');
          Navigator.of(context, rootNavigator: true).push<void>(
            CupertinoPageRoute(
              builder: (_) => const RegisterPage(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          '記録一覧',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.86,
            child: ListView.builder(
              itemCount: recordList.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Card(
                    child: ListTile(
                      title: Text(recordList[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('内容'),
                          Text('2022/2/22'),
                        ],
                      ),
                      trailing: const Icon(Icons.accessibility_new_rounded),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
