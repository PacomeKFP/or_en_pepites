import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/services/Resources/podcast.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';
import 'Components/PodcastItemComponent.dart';

class PodcastsListPage extends StatelessWidget {
  const PodcastsListPage({super.key});

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
            FutureBuilder(
                future: PodcastResource.getRemotePodcasts(),
                builder: (context, snapshot) {
                  List<Widget> children = [
                    const Center(child: CircularProgressIndicator())
                  ];

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      continue display;
                    case ConnectionState.active:
                      continue display;
                    case ConnectionState.waiting:
                      continue display;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        children = [Text(snapshot.error.toString())];
                        continue display;
                      }
                      if (!snapshot.hasData) {
                        children = [
                          const Text("Aucune newsletter n'est disponible")
                        ];
                        continue display;
                      }
                      List<bool> players = List.generate(
                          snapshot.data!.length, (index) => false);
                      children = snapshot.data!
                          .map((podcast) => PodcastItemComponent(
                                podcast: podcast,
                                players: players,
                                index: snapshot.data!.indexOf(podcast),
                              ))
                          .toList();

                      continue display;
                    display:
                    default:
                      return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Column(children: children));
                  }
                }),
          ],
        )),
      ),
    ));
  }
}
