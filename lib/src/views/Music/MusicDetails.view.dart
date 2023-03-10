import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';
import 'Components/components/player_widget.dart';

class PodcastDetailsPage extends StatefulWidget {
  final PodcastModel podcast;
  const PodcastDetailsPage({super.key, required this.podcast});

  @override
  State<PodcastDetailsPage> createState() => _PodcastDetailsPageState();
}

class _PodcastDetailsPageState extends State<PodcastDetailsPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();

    _player = AudioPlayer(playerId: "${widget.podcast.title}");
    if (widget.podcast.source == FileSource.network) {
      _player.setSourceDeviceFile(widget.podcast.path);
    }
  }

  @override
  Future<void> dispose() async {
    await _player.pause();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, "Talents en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar:
          AppNavigation(currentIndex: BottomNavigationItem.music.index),
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

                ///Widget de lecture
                PlayerWidget(player: _player),
                if (widget.podcast.source == FileSource.network)
                  TextButton.icon(
                    onPressed: () async => await _download(context),
                    icon: const Icon(Icons.download),
                    label: const Text("Télécharger"),
                  ),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.podcast.source == FileSource.network)
            FloatingActionButton(
              onPressed: () async => await _download(context),
              child: Icon(
                Icons.download,
                color: AppColors.light().gold,
              ),
            ),
          FloatingActionButton(
            onPressed: () async {
              await widget.podcast.addToFavorites();
            },
            child: Icon(
              Icons.favorite,
              color: AppColors.light().gold,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _player.state == PlayerState.playing
                    ? _player.pause()
                    : _player.resume();
              });
            },
            child: Icon(
              _player.state == PlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ],
      ),
    );
  }

  _download(context) async =>
      await widget.podcast.download(
      //   callback: (percent) {
      //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Le podcast a été téléchargé à $percent%'))
      //   );
        
      // }
      ).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Votre podcast a bien été téléchargé, il sera desormais disponible hors ligne'))));
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
