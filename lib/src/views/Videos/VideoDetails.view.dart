import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class VideoDetailsPage extends StatefulWidget {
  final Video video;
  const VideoDetailsPage({super.key, required this.video});

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  late VideoPlayerController _controller;

  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(widget.video.url)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
    _controller2 = YoutubePlayerController(
      initialVideoId: "sPNWQzHHm88"
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Informations en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
        currentIndex: 2,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // _controller.value.isInitialized
              //     ? AspectRatio(
              //         aspectRatio: _controller.value.aspectRatio,
              //         child: VideoPlayer(_controller),
              //       )
              //     : CircularProgressIndicator(),

              YoutubePlayer(
                controller: _controller2,
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
    ));
  }
}
