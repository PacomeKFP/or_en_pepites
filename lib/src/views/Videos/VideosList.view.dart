import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';
import 'package:or_en_pepite/src/services/Resources/video.dart';
import 'package:or_en_pepite/src/views/Videos/Components/VideoItemComponent.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class VideosListPage extends StatefulWidget {
  const VideosListPage({super.key});

  @override
  State<VideosListPage> createState() => _VideosListPageState();
}

class _VideosListPageState extends State<VideosListPage> {
  List<Future<Video>?> videos = VideoRessource.getVideos();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Informations en Pépites "),
      endDrawer: const DrawerComponent(),
            bottomNavigationBar: AppNavigation(currentIndex: BottomNavigationItem.video.index),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
            child: Column(
          children: videos
              .map(
                (video) => FutureBuilder(
                  future: video,
                  builder: (context, snapshot) {
                    Widget child =
                        const Center(child: CircularProgressIndicator());

                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        continue display;
                      case ConnectionState.active:
                        continue display;
                      case ConnectionState.waiting:
                        continue display;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          child = Text(snapshot.error.toString());
                          continue display;
                        }
                        if (!snapshot.hasData) {
                          child =
                              const Text("Aucune newsletter n'est disponible");
                          continue display;
                        }
                        child = VideoItemComponent(video: snapshot.data!);

                        continue display;
                      display:
                      default:
                        return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: child);
                    }
                  },
                ),
              )
              .toList(),
        )),
      ),
    ));
  }
}
