import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/router/app_router.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/views/Music/MusicDetails.view.dart';

class PageViewComponent extends StatefulWidget {
  final PageController controller;
  final Map? data;
  final FileSource fileSource;
  const PageViewComponent(
      {super.key, required this.controller, required this.data, required this.fileSource});

  @override
  State<PageViewComponent> createState() => _PageViewComponentState();
}

class _PageViewComponentState extends State<PageViewComponent> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.controller,
      children: widget.data!.entries.toList().map((MapEntry entry) {
        var dataType = entry.value;
        var key = entry.key;
        if ([null, []].contains(dataType as List) ||
            (dataType as List).isEmpty) {
          return Text('Aucun donnée disponible');
        }

        return SingleChildScrollView(
          child: Column(
            children: (dataType)
                .map((data) => InkWell(
                      onTap: () async {
                        DataModel dataModel = DataModel.fromEntry(
                            MapEntry(entry.key,
                                (data as Map).cast<String, String>()),
                            widget.fileSource);
                        await context.router.push(dataModel.pageRoute());
                      },
                      child: ListTile(
                        title: Text(data['title'].toString()),
                        subtitle: Text(
                          data['description'].toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      }).toList(),
    );
  }
}
