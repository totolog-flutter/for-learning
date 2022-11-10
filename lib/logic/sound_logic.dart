import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_youtube1/data/count_data.dart';

class SoundLogic {
  static const SOUND_DATA_UP = 'assets/sounds/kicking_water.mp3';
  static const SOUND_DATA_DOWN = 'assets/sounds/polishing1.mp3';
  static const SOUND_DATA_REST = '/assets/sounds/rolling_coin.mp3';

  final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );

  void load() {
    _cache.loadAll([SOUND_DATA_UP, SOUND_DATA_DOWN, SOUND_DATA_REST]);
  }

  void valueChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0 && newData.count == 0)
      playRestSound();
    if (oldData.countUp +1 == newData.countUp) playUpSound();
    if (oldData.countDown +1 == newData.countDown) playDownSound();
  }

  void playUpSound() {
    _cache.play(SOUND_DATA_UP);
  }

  void playDownSound() {
    _cache.play(SOUND_DATA_DOWN);
  }

  void playRestSound() {
    _cache.play(SOUND_DATA_REST);
  }
}
