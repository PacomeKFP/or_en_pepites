import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class PodcastDetailsPage extends StatefulWidget {
  final PodcastModel podcast;
  const PodcastDetailsPage({super.key, required this.podcast});

  @override
  State<PodcastDetailsPage> createState() => _PodcastDetailsPageState();
}

class _PodcastDetailsPageState extends State<PodcastDetailsPage> {
  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];
  final audios = <Audio>[
    Audio.network(
      'https://audio.ausha.co/brwewqiDjLQB.mp3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    //_subscriptions.add(_assetsAudioPlayer.playlistFinished.listen((data) {
    //  print('finished : $data');
    //}));
    //openPlayer();
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));

    openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      // autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Talents en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
        currentIndex: 1,
      ),
      body: Container(
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
    ));
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
