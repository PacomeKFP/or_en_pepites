import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/logic/blocs.dart';
import 'package:or_en_pepite/src/models/models.dart';

class PageViewComponent extends StatefulWidget {
  final PageController controller;
  final Map? data;
  final FileSource fileSource;
  const PageViewComponent(
      {super.key,
      required this.controller,
      required this.data,
      required this.fileSource});

  @override
  State<PageViewComponent> createState() => _PageViewComponentState();
}

class _PageViewComponentState extends State<PageViewComponent> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: NeverScrollableScrollPhysics(),
      onPageChanged: (int page) =>
          context.read<TabsManagerBloc>().add(MoveToPage(nextPage: page)),
      controller: widget.controller,
      children: widget.data!.entries.toList().map((MapEntry entry) {
        var dataType = entry.value;
        if ([null, []].contains(dataType as List) ||
            (dataType).isEmpty) {
          return const Text('Aucune donnée disponible');
        }

        return SingleChildScrollView(
          child: Column(
            children: (dataType)
                .map((data) => InkWell(
                    onTap: () async {
                      DataModel dataModel = DataModel.fromEntry(
                          MapEntry(
                              entry.key, (data as Map).cast<String, String>()),
                          widget.fileSource);
                      await context.router.push(dataModel.pageRoute);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.doubleSpace,
                          vertical: Dimens.oneHalfPadding),
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding,
                          vertical: Dimens.halfPadding),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.light().gold.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(Dimens.radius),
                        color: AppColors.light()
                            .gold
                            .withOpacity(Random().nextInt(75) / 100 + .05),
                      ),
                      child: ListTile(
                        title: Text(data['title'].toString()),
                        subtitle: data['description'] != null
                            ? Text(
                                data['description'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : null,
                      ),
                    )))
                .toList(),
          ),
        );
      }).toList(),
    );
  }
}
