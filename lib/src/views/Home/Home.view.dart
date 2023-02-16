import 'package:auto_route/auto_route.dart';
import "package:flutter/material.dart";
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:or_en_pepite/src/views/Components/AppBar.dart';
import 'package:or_en_pepite/src/views/Components/Drawer.dart';

import '../Components/BottomNavigationBar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, getRouteName(context.topRoute.name)),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
        currentIndex: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Dimens.oneHalfPadding),
                child: Text(
                  'Bienvenue',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.light().gold),
                ),
              ),
              Text(
                AppTexts.welcome,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
