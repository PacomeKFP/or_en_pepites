import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context, "À Propos"),
        endDrawer: const DrawerComponent(),
      bottomNavigationBar: AppNavigation(currentIndex: BottomNavigationItem.home.index),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.oneHalfPadding,
                    horizontal: Dimens.doublePadding),
                child: Column(
                  children: [
                    Text(
                      "Or en pépites est un concept qui permet de donner des pistes de réflexion pour la création de la connaissance spécifique dans différents domaines d’activités.",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text(
                        "Or en pépites « l’excellence est un comportement » Rubriques :"),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                        "Podcast\nNewsletter\nVidéo ressources (actualités sciences sociales)"),
                    const SizedBox(height: 10),
                    
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
