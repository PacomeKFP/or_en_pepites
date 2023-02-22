import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

enum BottomNavigationItem {
  home,
  music,
  video,
  blog,
  downloads;

  String get label => this == home
      ? "Acceuil"
      : this == music
          ? "Podcasts"
          : this == video
              ? "Vidéos"
              : this == blog
                  ? "Newsletters"
                  : "Telechargements";

  String get path => this == home
      ? "/"
      : this == music
          ? "/podcasts"
          : this == video
              ? "/videos"
              : this == blog
                  ? "/newsletters"
                  : "/downloads";

  IconData get icon => this == home
      ? FontAwesomeIcons.house
      : this == music
          ? FontAwesomeIcons.podcast
          : this == video
              ? FontAwesomeIcons.video
              : this == blog
                  ? FontAwesomeIcons.newspaper
                  : FontAwesomeIcons.download;

  Color get bgColor => this == home
      ? AppColors.light().onBackground
      : this == music
          ? AppColors.light().onBackground
          : this == video
              ? AppColors.light().onBackground
              : this == blog
                  ? AppColors.light().onBackground
                  : AppColors.light().onBackground;
}

enum DrawerOptions {
  account,
  favorite,
  history;

  String get path => this == account ? "/account":"/home";
  String get label => this == account
      ? 'Mon compte'
      : this == favorite
          ? 'Favoris'
          : 'Historique';
  IconData get icon => this == account
      ? Icons.account_circle_sharp
      : this == favorite
          ? Icons.favorite
          : Icons.history;
}
