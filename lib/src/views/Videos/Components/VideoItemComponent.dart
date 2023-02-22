import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/core/router/app_router.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoItemComponent extends StatelessWidget {
  final Video video;

  const VideoItemComponent({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(VideoDetailsRoute(video: video)),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.halfSpace),
          // height: 300,
          child: Column(
            
          )
          

        ),
      ),
    );
  }
}
