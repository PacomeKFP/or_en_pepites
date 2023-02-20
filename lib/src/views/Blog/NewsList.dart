import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/services/Resources/resources.dart';
import 'package:or_en_pepite/src/views/Blog/Components/LetterItem.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class NewsLettersListPage extends StatelessWidget {
  const NewsLettersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Concepts en Pépites"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(
        currentIndex: 3,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: ResourcesServices.geNewsLetters(),
            builder: (context, snapshot) {
              Widget child = const Center(child: CircularProgressIndicator());

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  continue display;
                case ConnectionState.active:
                  continue display;
                case ConnectionState.waiting:
                  continue display;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    child = const Text(
                        "Une erreur es survenue, veullez relancer l'application");
                    continue display;
                  }
                  if (!snapshot.hasData) {
                    child = const Text("Aucune newsletter n'est disponible");
                    continue display;
                  }
                  child = Column(
                    children: snapshot.data!
                        .map((newsletter) => LetterItem(
                              title: newsletter['title']!,
                              content: newsletter['content']!,
                            ))
                        .toList(),
                  );

                  continue display;
                display:
                default:
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: child,
                  );
              }
            },
          ),
        ),
      ),
    ));
  }
}
