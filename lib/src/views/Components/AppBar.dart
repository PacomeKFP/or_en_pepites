import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

PreferredSizeWidget appBarComponent(context, name) => AppBar(
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: AppColors.light().onSurface,
              size: 24,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      leading: AutoLeadingButton(
        color: AppColors.light().onSurface,
      ),
    );
