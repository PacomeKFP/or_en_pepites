import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/views/Components/ImageComponent.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class NewsLetterDetailsPage extends StatelessWidget {
  final NewsletterModel newsletter;
  const NewsLetterDetailsPage({super.key, required this.newsletter});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: appBarComponent(context, "Concepts en Pépites"),
            endDrawer: const DrawerComponent(),
            bottomNavigationBar: const AppNavigation(
              currentIndex: 3,
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: List<Widget>.generate(
                    newsletter.images.length,
                    (index) => Column(
                      children: [
                        ImageComponent(path: newsletter.images[index]),
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimens.oneHalfPadding,
                                horizontal: Dimens.doublePadding),
                            child: Text(
                              newsletter.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: AppColors.light().gold),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.padding,
                              vertical: Dimens.halfPadding),
                          child: Text(
                            newsletter.paragraphs[index],
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
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await newsletter.addToFavorites().then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Ajouté aux favoris avec success'))));
                },
                child: Icon(
                  Icons.favorite,
                  color: AppColors.light().gold,
                ))));
  }
}
