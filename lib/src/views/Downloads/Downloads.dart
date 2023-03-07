import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/logic/blocs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Resources/manager.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

import '../Components/AppBar.dart';
import '../Components/BottomNavigationBar.dart';
import '../Components/Drawer.dart';
import '../Components/PageViewComponent.dart';
import '../Components/SliversNavigationComponent.dart';

class DownloadsPage extends StatefulWidget {
  DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => DownloadsPageState();
}

class DownloadsPageState extends State<DownloadsPage> {
  Future _getData() async {
    try {
      DataManager dataManager = await DataManager.create();
      var data = await dataManager.get(from: DataLocals.downloads);

      await dataManager.test(
          data: json.encode((data as Map).values.toList()),
          fileName: 'histvals.json');

      return data;
    } catch (e) {
      print(e);
    }
  }

  late String activeTab;
PageController controller =
            PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
          appBar: appBarComponent(context, "Téléchargements"),
          endDrawer: const DrawerComponent(),
          bottomNavigationBar: const AppNavigation(currentIndex: 4),
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
                        return snapshot.connectionState ==
                                    ConnectionState.done &&
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
                                      fileSource: FileSource.local,
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
