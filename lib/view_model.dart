import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/data/count_data.dart';
import 'package:flutter_youtube1/logic/logic.dart';
import 'package:flutter_youtube1/logic/sound_logic.dart';
import 'package:flutter_youtube1/provider.dart';

class ViewModel {
  Logic _logic = Logic();
  SoundLogic _soundLogic = _soundLogic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
    _soundLogic.load();
  }

  get countNum => _ref.watch(countDataProvider).count.toString();

  get countUpNum =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDownNum => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldData = _ref.watch(countDataProvider.state).state;
    _ref.watch(countDataProvider.state).state = _logic.countData;
    CountData newData = _ref.watch(countDataProvider.state).state;
    _soundLogic.valueChanged(oldData, newData);
  }
}
