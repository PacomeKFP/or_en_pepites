import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class VideoDetailsPage extends StatelessWidget {
  final Video video;
  const VideoDetailsPage({super.key, required this.video});

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Dimens.oneHalfPadding),
                child: Text(
                  video.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.light().gold),
                ),
              ),
              Text(AppTexts.welcome)
            ],
          ),
        ),
      ),
    ));
  }
}
