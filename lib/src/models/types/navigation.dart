import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

enum BottomNavigationItem {
  home,
  blog,
  video,
  music,
  downloads;

  String get label => this == home
      ? "Acceuil"
      : this == music
          ? "Talents"
          : this == video
              ? "Informations"
              : this == blog
                  ? "Concepts"
                  : "Telechargements";

  BottomNavigationItem fromString(String str) {
    switch (str) {
      case 'video':
      case 'videos':
        return video;
      case 'podcast':
      case 'podcasts':
        return music;
      case 'newsletters':
      case 'newsletter':
        return blog;
      default:
        return music;
    }
  }

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
      ? Icons.house
      : this == music
          ? Icons.my_library_music_outlined
          : this == video
              ? Icons.video_library_outlined
              : this == blog
                  ? Icons.newspaper
                  : Icons.download;

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
  history,
  about;

  String get path => "/$name";
  String get label => this == account
      ? 'Mon compte'
      : this == favorite
          ? 'Favoris'
          : this == history
              ? 'Historique'
              : "À propos";
  IconData get icon => this == account
      ? Icons.account_circle_sharp
      : this == favorite
          ? Icons.favorite
          : this==history? Icons.history: Icons.info_outlined;
}
