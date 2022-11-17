import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/sample/data/register_data.dart';
import 'package:flutter_youtube1/src/features/sample/data/shared_preference.dart';

final _sharedPreference = SharedPreference();

class RegisterPageNotifier extends StateNotifier<Register> {
  RegisterPageNotifier(this.ref)
      : super(Register(title: '', content: '', selectedDay: DateTime.now()));

  final Ref ref;

  Future<void> selectDay(DateTime selectDay) async {
    state = state.copyWith(selectedDay: selectDay);
  }

  Future<void> save() async {
    await _sharedPreference.saveRecord(
        state.title, state.content, state.selectedDay);
  }

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setContent(String value) {
    state = state.copyWith(content: value);
  }
}
