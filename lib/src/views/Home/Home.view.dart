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
    return Scaffold(
      appBar: appBarComponent(context, "Accueil"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
    currentIndex: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/home.png'),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.doublePadding),
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
      ),
    );
  }
}
