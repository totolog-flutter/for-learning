import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/sample/data/sample_page_data.dart';
import 'package:flutter_youtube1/src/features/sample/data/shared_preference.dart';

class SamplePageNotifier extends StateNotifier<SamplePageData> {
  SamplePageNotifier() : super(SamplePageData()) {
    initState();
  }

  final _sharedPreference = SharedPreference();

  Future<void> initState() async {
    final records = await _sharedPreference.getRecord();
    state = state.copyWith(recordList: records);
  }

  void increment() {
    state = state.copyWith(number: state.number + 1);
  }

  Future<void> recordsReset() async {
    state = state.copyWith(recordList: null);
    await _sharedPreference.resetRecords();
  }
}
