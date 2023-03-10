part of 'media_player_bloc.dart';

@immutable
abstract class MediaPlayerEvent {}

class LaunchMedia extends MediaPlayerEvent {
  final dynamic mediaPlayer;
  LaunchMedia({required this.mediaPlayer});
}
class StopCurrentMedia extends MediaPlayerEvent{}
