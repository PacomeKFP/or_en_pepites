/*
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoItemComponent extends StatefulWidget {
  final Video video;
  const VideoItemComponent({super.key, required this.video});

  @override
  State<VideoItemComponent> createState() => _VideoItemComponentState();
}

class _VideoItemComponentState extends State<VideoItemComponent> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //title de la video
          Container(
            child: Text(
              widget.video.title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //placer la video
          Container(
              child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
*/