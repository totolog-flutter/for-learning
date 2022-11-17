import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/sample/controller/register_provider.dart';
import 'package:flutter_youtube1/src/features/sample/data/register_data.dart';
import 'package:table_calendar/table_calendar.dart';

final registerPageProvider =
    StateNotifierProvider<RegisterPageNotifier, Register>((ref) {
  return RegisterPageNotifier(ref);
});

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerPageNotifier = ref.read(registerPageProvider.notifier);
    final registerPageState = ref.watch(registerPageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '記録を追加',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              // await registerPageNotifier.save();
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 20, right: 8),
              child: Text(
                '保存',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlueAccent),
              ),
            ),
          )
        ],
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),

              /// このままだと別の月を選択すると、、、。
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(registerPageState.selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) async {
                await registerPageNotifier.selectDay(selectedDay);

                ///追加課題
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'タイトル',
                  labelStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  registerPageNotifier.setTitle(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autofocus: true,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: '内容',
                  labelStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  registerPageNotifier.setContent(value);
                },
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                title: Text(registerPageState.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(registerPageState.content),
                    Text(registerPageState.selectedDay.toString()),
                  ],
                ),
                trailing: const Icon(Icons.accessibility_new_rounded),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
