import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/core/router/app_router.dart';

import '../NewsDetails.dart';

class LetterItem extends StatelessWidget {
  final NewsletterModel newsletter;
  const LetterItem({super.key, required this.newsletter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(NewsLetterDetailsRoute(newsletter: newsletter)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.doubleSpace, vertical: Dimens.oneHalfPadding),
        margin: const EdgeInsets.symmetric(
            horizontal: Dimens.padding, vertical: Dimens.halfPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.light().gold.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(Dimens.radius),
          color: AppColors.light()
              .gold
              .withOpacity(Random().nextInt(75) / 100 + .05),
        ),
        child: Text(
          newsletter.title,
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
