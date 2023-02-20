import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class PodcastDetailsPage extends StatelessWidget {
  const PodcastDetailsPage({super.key});

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
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Dimens.oneHalfPadding),
                child: Text(
                  'Podcasts',
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
