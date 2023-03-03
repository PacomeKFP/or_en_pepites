import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Resources/manager.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';
import '../Components/PageViewComponent.dart';
import '../Components/SliversNavigationComponent.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  Future _getData() async {
    try {
      DataManager dataManager = await DataManager.create();
      var data = await dataManager.get(from: DataLocals.favorites);

      await dataManager.test(
          data: json.encode((data as Map).values.toList()),
          fileName: 'histvals.json');

      return data;
    } catch (e) {
      print('err');
      print(e);
    }
  }

  late String activeTab;

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarComponent(context, "Favoris"),
      endDrawer: const DrawerComponent(),
      bottomNavigationBar: const AppNavigation(currentIndex: 0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.doublePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: _getData(),
                  builder: (context, snapshot) {
                    Map? data = snapshot.data;
                    return snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData
                        ? Container(
                            height: MediaQuery.of(context).size.height,
                            child: NestedScrollView(
                                headerSliverBuilder:
                                    (context, innerBoxIsScrolled) => [
                                          NavigationComponent(
                                              data: data,
                                              controller: controller)
                                        ],
                                body: PageViewComponent(
                                  controller: controller,
                                  data: data,
                                  fileSource: FileSource.network,
                                )),
                          )
                        : const CircularProgressIndicator();
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
