part of 'media_player_bloc.dart';

@immutable
abstract class MediaPlayerStates {
  final bool mediaIsPlaying;
  final dynamic currentMediaPLayer;

  MediaPlayerStates({required this.mediaIsPlaying, this.currentMediaPLayer});
}

class MediaPlayerState extends MediaPlayerStates {
  MediaPlayerState(
      {super.mediaIsPlaying = false, required super.currentMediaPLayer});
}
