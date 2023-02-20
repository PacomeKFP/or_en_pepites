import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:or_en_pepite/src/views/Auth/Auth.view.dart';
import 'package:or_en_pepite/src/views/Blog/NewsDetails.dart';
import 'package:or_en_pepite/src/views/Blog/NewsList.dart';
import 'package:or_en_pepite/src/views/Downloads/Downloads.dart';
import 'package:or_en_pepite/src/views/Home/Home.view.dart';
import 'package:or_en_pepite/src/views/Music/MusicDetails.view.dart';
import 'package:or_en_pepite/src/views/Music/MusicsList.view.dart';
import 'package:or_en_pepite/src/views/Profile/UserProfile.view.dart';
import 'package:or_en_pepite/src/views/Videos/VideoDetails.view.dart';
import 'package:or_en_pepite/src/views/Videos/VideosList.view.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    /// pour l'authentification
    AutoRoute(
      page: AuthenticationPage,
      path: '/auth',
    ),

    /// pour l'aceuil
    AutoRoute(
      page: UserHomePage,
      initial: true,
      path: '/',
    ),

    ///pour les telechargements
    AutoRoute(
      page: DownloadsPage,
      path: '/downloads',
    ),

    /// pour la liste des podcasts
    AutoRoute(
      page: PodcastsListPage,
      path: '/podcasts',
    ),

    /// Pour ecouter un podcast
    AutoRoute(
      page: PodcastDetailsPage,
      path: '/podcasts/read',
    ),

    ///pour la liste des videos
    AutoRoute(
      page: VideosListPage,
      path: '/videos',
    ),

    ///pour ecouter une video
    AutoRoute(
      page: VideoDetailsPage,
      path: '/videos/watch',
    ),

    ///pour la liste des newsletters
    AutoRoute(
      page: NewsLetterDetailsPage,
      path: '/newsletters/read',
    ),

    ///Pour ecouter une newsletter
    AutoRoute(
      page: NewsLettersListPage,
      path: '/newsletters',
    ),

    // pour Ouvir la page de profil
    AutoRoute(page: UserProfilePage, path: '/account')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  String get routeName => getRouteName(current.name);
}
