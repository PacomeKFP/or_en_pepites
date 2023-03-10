import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';
import 'package:or_en_pepite/src/views/Components/AppBar.dart';
import 'package:or_en_pepite/src/views/Components/Drawer.dart';
import 'package:or_en_pepite/src/views/Components/ImageComponent.dart';

import '../Components/BottomNavigationBar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, "Accueil"),
      endDrawer: const DrawerComponent(),
            bottomNavigationBar: AppNavigation(currentIndex: BottomNavigationItem.home.index),

      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: List<Widget>.generate(
                AppTexts.welcome.length,
                (index) => Column(
                  children: [
                    ImageComponent(path: "assets/images/home$index.png"),
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimens.oneHalfPadding,
                            horizontal: Dimens.doublePadding),
                        child: Text(
                          AppTexts.welcomeTitle,
                          style: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme)
                              .titleLarge!.copyWith(color: AppColors.light().gold),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding,
                          vertical: Dimens.halfPadding),
                      child: Text(
                        AppTexts.welcome[index],
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
