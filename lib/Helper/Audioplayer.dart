import 'package:just_audio/just_audio.dart';

class AudioManager {
  // Private constructor
  AudioManager._privateConstructor();

  // The single static instance
  static final AudioManager _instance = AudioManager._privateConstructor();

  // Public getter to access the instance
  static AudioManager get instance => _instance;

  // The actual AudioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Getter to access AudioPlayer if needed
  AudioPlayer get player => _audioPlayer;

  // Example: play a URL
  Future<void> play(String url) async {
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
  }

  int? playingLocalIndex;
  int? playingRemoteIndex;

  bool get isPlaying => _audioPlayer.playing;
  bool get localPlaying => playingLocalIndex != null;
  bool get remotePlaying => playingRemoteIndex != null;

  int? get currentIndex => playingLocalIndex ?? playingRemoteIndex;

  // Example: pause
  void pause() {
    _audioPlayer.pause();
  }

  // Example: stop
  void stop() {
    _audioPlayer.stop();
  }

  // Clean up
  void dispose() {
    _audioPlayer.dispose();
  }
}
