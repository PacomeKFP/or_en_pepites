import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  bool refsIsOn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context, "À Propos"),
        endDrawer: const DrawerComponent(),
        bottomNavigationBar: const AppNavigation(currentIndex: 0),
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
                    StatefulBuilder(
                        builder: (context, setState) => ListTile(
                              title: TextButton(
                                onPressed: () =>
                                    setState(() => refsIsOn = !refsIsOn),
                                child: Text(
                                  'References bibliographiques',
                                  style: GoogleFonts.quicksand(
                                      color: AppColors.light().gold,
                                      fontSize: 16),
                                ),
                              ),
                              subtitle: refsIsOn
                                  ? Column(
                                      children: AppTexts.refs
                                          .map((e) => Column(
                                                children: List.generate(
                                                    e.length,
                                                    (index) => Text(
                                                          e[index],
                                                          style: index == 1
                                                              ? GoogleFonts.quicksand().copyWith(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)
                                                              : null,
                                                        ))
                                                  ..add(const Divider(
                                                    height: 2,
                                                  )),
                                              ))
                                          .toList(),
                                    )
                                  : null,
                            ))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
