import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/data/count_data.dart';

final titleProvider = Provider<String>((ref) {
  return 'RiverPod Demo Home Page';
});
final messageProvider = Provider<String>((ref) {
  return 'pushした回数:';
});
final countProvider = StateProvider<int>((ref) {
  return 0;
});

final countDataProvider = StateProvider<CountData>(
  (ref) => CountData(
    count: 0,
    countUp: 0,
    countDown: 0,
  ),
);
