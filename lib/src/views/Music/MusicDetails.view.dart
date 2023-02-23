import 'dart:async';

import 'package:audioplayers/audioplayers.dart' as aud;
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';
import 'Components/components/player_widget.dart';

class PodcastDetailsPage extends StatefulWidget {
  final PodcastModel podcast;
  final String playerId;
  const PodcastDetailsPage(
      {super.key, required this.podcast, required this.playerId});

  @override
  State<PodcastDetailsPage> createState() => _PodcastDetailsPageState();
}

class _PodcastDetailsPageState extends State<PodcastDetailsPage> {
  late aud.AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = aud.AudioPlayer(playerId: widget.playerId);
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, "Talents en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
        currentIndex: 1,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.podcast.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.light().gold),
                ),
                const SizedBox(height: 10),
                //TODO: ajouter la lecture ici

                ///////////////////////////////////////////////
                PlayerWidget(player: _player),
                //on affiche la description du podcast
                const SizedBox(height: 10),
                Text(
                  widget.podcast.description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _player.state == PlayerState.playing
                ? _player.pause()
                : _player.resume();
          });
        },
        child: Icon(
          _player.state == PlayerState.playing ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

/*

Text(
                podcast.title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.light().gold),
              ),
              const SizedBox(height: 10),
              //TODO: ajouter la lecture ici

///////////////////////////////////////////////

              //on affiche la description du podcast
              const SizedBox(height: 10),
              Text(
                podcast.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

*/
