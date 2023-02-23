import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum AudioSource {
  network,
  assets,
  file;
}

class SoundPlayer extends StatefulWidget {
  final String filePath;
  final AudioSource source;
  const SoundPlayer({super.key, required this.filePath, required this.source});

  @override
  State<SoundPlayer> createState() => SoundPlayerState();
}

class SoundPlayerState extends State<SoundPlayer> {
  late AudioPlayer _player;
  late Duration duration;
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
