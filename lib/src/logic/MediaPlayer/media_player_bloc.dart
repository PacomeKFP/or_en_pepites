import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'media_player_event.dart';
part 'media_player_state.dart';

class MediaPlayerBloc extends Bloc<MediaPlayerEvent, MediaPlayerStates> {
  MediaPlayerBloc() : super(MediaPlayerState(currentMediaPLayer: null)) {
    on<LaunchMedia>((event, emit) async {
      if (state.mediaIsPlaying) {
        await state.currentMediaPLayer.pause();
        add(StopCurrentMedia());
      }
      emit(MediaPlayerState(
          currentMediaPLayer: event.mediaPlayer, mediaIsPlaying: true));
    });

    on<StopCurrentMedia>((event, emit) async {
      if (state.mediaIsPlaying) {
        await state.currentMediaPLayer.pause();
        add(StopCurrentMedia());
      }
      emit(MediaPlayerState(currentMediaPLayer: null, mediaIsPlaying: false));
    });
  }
}
