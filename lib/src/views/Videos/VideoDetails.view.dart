import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class VideoDetailsPage extends StatefulWidget {
  final VideoModel video;
  // final Map<String, String> videoJson;
  const VideoDetailsPage({super.key, required this.video});

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  late VideoPlayerController _localVideoPlayerController;
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.video.source == FileSource.local) {
      _localVideoPlayerController =
          VideoPlayerController.file(File(widget.video.path))
            ..initialize().then((_) {
              setState(() {});
            });
    } else {
      _youtubePlayerController =
          YoutubePlayerController(initialVideoId: "sPNWQzHHm88");
    }
  }

  @override
  void dispose() {
    print('disposing from viideo');
    _youtubePlayerController.pause();
    _localVideoPlayerController.pause();

    // _youtubePlayerController.dispose();
    // _localVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Informations en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar:
          AppNavigation(currentIndex: BottomNavigationItem.video.index),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.video.source == FileSource.local
                  ? _localVideoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio:
                              _localVideoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_localVideoPlayerController),
                        )
                      : CircularProgressIndicator()
                  : YoutubePlayer(
                      controller: _youtubePlayerController,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      onReady: () {
                        print('Player is ready.');
                      },
                    ),
              Text(
                widget.video.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.light().gold),
              ),
              const SizedBox(height: 10),
              Text(widget.video.description)
            ],
          ),
        ),
      ),
      floatingActionButton: widget.video.source == FileSource.network
          ? FloatingActionButton(
              onPressed: () async {
                await widget.video.addToFavorites();
              },
              child: Icon(Icons.favorite, color: AppColors.light().gold),
            )
          : null,
    ));
  }
}
