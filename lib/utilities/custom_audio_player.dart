/*
 * These are the external dependencies
 */
import 'package:just_audio/just_audio.dart';

/*
 * Singleton pattern is used for AudioPlayer instance,
 * because we don't need instances more than one and
 * we can access from anywhere across our app
 */
class CustomAudioPlayer {
  CustomAudioPlayer._privateConstructor();

  static final CustomAudioPlayer _instance =
      CustomAudioPlayer._privateConstructor();
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static CustomAudioPlayer get instance => _instance;

  void playSound(String path) {
    Future.delayed(Duration.zero, () async {
      await _audioPlayer.setAsset(path);
      _audioPlayer.play();
    });
  }

  void playCoinSound() {
    playSound('assets/audio/coin_sound.mp3');
  }
}
