import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/views/About/About.view.dart';
import 'package:or_en_pepite/src/views/Auth/Auth.view.dart';
import 'package:or_en_pepite/src/views/Blog/NewsDetails.dart';
import 'package:or_en_pepite/src/views/Blog/NewsList.dart';
import 'package:or_en_pepite/src/views/Downloads/Downloads.dart';
import 'package:or_en_pepite/src/views/Favorites/Favorites.dart';
import 'package:or_en_pepite/src/views/History/History.dart';
import 'package:or_en_pepite/src/views/Home/Home.view.dart';
import 'package:or_en_pepite/src/views/Music/MusicDetails.view.dart';
import 'package:or_en_pepite/src/views/Music/MusicsList.view.dart';
import 'package:or_en_pepite/src/views/Profile/UserProfile.view.dart';
import 'package:or_en_pepite/src/views/Videos/VideoDetails.view.dart';
import 'package:or_en_pepite/src/views/Videos/VideosList.view.dart';
part 'app_router.gr.dart';
part 'app_router.guards.dart';

List<RouteTransitionsBuilder> transitions = [
  TransitionsBuilders.slideBottom,
  TransitionsBuilders.slideTop,
  TransitionsBuilders.slideLeft,
  TransitionsBuilders.slideRight,
  TransitionsBuilders.slideRightWithFade,
  TransitionsBuilders.slideLeftWithFade,
  TransitionsBuilders.slideLeft,
  TransitionsBuilders.zoomIn,
  TransitionsBuilders.fadeIn
];

int trans() => Random().nextInt(transitions.length);

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <CustomRoute>[
    /// pour l'authentification
    CustomRoute(
      page: AuthenticationPage,
      path: '/auth',
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),

    /// pour l'accueil
    CustomRoute(
        guards: [CheckAuthState],
        page: UserHomePage,
        initial: true,
        path: '/',
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),

    ///pour les telechargements
    CustomRoute(
        guards: [CheckAuthState],
        page: DownloadsPage,
        path: '/downloads',
        transitionsBuilder: TransitionsBuilders.slideLeft),

    /// pour la liste des podcasts
    CustomRoute(
        guards: [CheckAuthState],
        page: PodcastsListPage,
        path: '/podcasts',
        transitionsBuilder: TransitionsBuilders.slideTop),

    /// Pour ecouter un podcast
    CustomRoute(
        guards: [CheckAuthState],
        page: PodcastDetailsPage,
        path: '/podcasts/read/',
        transitionsBuilder: TransitionsBuilders.zoomIn),

    ///pour la liste des videos
    CustomRoute(
        guards: [CheckAuthState],
        page: VideosListPage,
        path: '/videos',
        transitionsBuilder: TransitionsBuilders.slideTop),

    ///pour ecouter une video
    CustomRoute(
        guards: [CheckAuthState],
        page: VideoDetailsPage,
        path: '/videos/watch/',
        transitionsBuilder: TransitionsBuilders.zoomIn),

    ///pour la liste des newsletters
    CustomRoute(
        guards: [CheckAuthState],
        page: NewsLetterDetailsPage,
        path: '/newsletters/read/',
        transitionsBuilder: TransitionsBuilders.slideBottom),

    ///Pour ecouter une newsletter
    CustomRoute(
        guards: [CheckAuthState],
        page: NewsLettersListPage,
        path: '/newsletters',
        transitionsBuilder: TransitionsBuilders.zoomIn),

// drawer Navigation
    // pour Ouvir la page de profil
    CustomRoute(
        guards: [CheckAuthState],
        page: UserProfilePage,
        path: '/account',
        transitionsBuilder: TransitionsBuilders.slideRight),

    /// Pour consulter l'historique de navigation
    CustomRoute(
        guards: [CheckAuthState],
        page: HistoryPage,
        path: '/history',
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),

    /// Pour consulter la liste des favoris
    CustomRoute(
        guards: [CheckAuthState],
        page: FavoritesPage,
        path: '/favorite',
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),

    /// Pour la page À propos
    CustomRoute(
        guards: [CheckAuthState],
        page: AboutPage,
        path: '/about',
        transitionsBuilder: TransitionsBuilders.slideRight),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.checkAuthState});
}
