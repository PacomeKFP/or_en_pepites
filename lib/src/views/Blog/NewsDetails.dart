import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';

class NewsLetterDetailsPage extends StatelessWidget {
  final String title;
  final String content;
  const NewsLetterDetailsPage({super.key, required this.title, required this.content});

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
          child: Column(
            children: [
              Image.asset('assets/images/newsletter.png'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.oneHalfPadding,
                    horizontal: Dimens.doublePadding),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.light().gold),
                ),
              ),
              Text(content)
            ],
          ),
        ),
      ),
    ));
  }
}
