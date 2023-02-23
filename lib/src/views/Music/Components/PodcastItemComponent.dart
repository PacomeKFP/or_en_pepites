import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/core/router/app_router.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class PodcastItemComponent extends StatefulWidget {
  final PodcastModel podcast;
  List<bool> players;
  int index;

  PodcastItemComponent(
      {super.key,
      required this.podcast,
      required this.players,
      required this.index});

  @override
  State<PodcastItemComponent> createState() => _PodcastItemComponentState();
}

class _PodcastItemComponentState extends State<PodcastItemComponent> {
  late AudioPlayer _player;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.router.push(PodcastDetailsRoute(podcast: widget.podcast)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius)),
        color: AppColors.light().gold.withOpacity(.2),
        elevation: 16,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.halfSpace),
          child: ListTile(
            leading: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.radius))),
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      for (var i = 0; i < widget.players.length; i++) {
                        if (i != widget.index) widget.players[i] = false;
                      }
                      widget.players[widget.index] =
                          !widget.players[widget.index];
                    });
                    if (widget.players[widget.index]) {
                      return await _player.play();
                    }
                    return await _player.pause();
                  },
                  child: Icon(
                    widget.players[widget.index]
                        ? Icons.pause_circle_outline_rounded
                        : Icons.play_circle_fill_rounded,
                    size: 48,
                  ),
                )),
            title: Text(
              widget.podcast.title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.podcast.description,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
