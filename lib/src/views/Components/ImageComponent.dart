import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';

class ImageComponent extends StatelessWidget {
  final String path;
  final FileSource source;
  const ImageComponent(
      {super.key, required this.path, this.source = FileSource.local});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(1.5*Dimens.radius)),
      child: Image.asset(path),
    );
  }
}
