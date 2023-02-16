import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/utils/functions.dart';
import 'package:or_en_pepite/src/views/Auth/Auth.view.dart';
import 'package:or_en_pepite/src/views/Blog/Blog.dart';
import 'package:or_en_pepite/src/views/Downloads/Downloads.dart';
import 'package:or_en_pepite/src/views/Home/Home.view.dart';
import 'package:or_en_pepite/src/views/Music/Music.view.dart';
import 'package:or_en_pepite/src/views/Profile/UserProfile.view.dart';
import 'package:or_en_pepite/src/views/Videos/Videos.view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: AuthenticationPage, path: '/auth', name: 'Authentification'),
    AutoRoute(page: UserHomePage, initial: true, path: '/', name: 'Accueil'),
    AutoRoute(page: DownloadsPage, path: '/downloads', name: 'Telechargements'),
    AutoRoute(page: PodcastPage, path: '/podcasts', name: 'talents_pepites'),
    AutoRoute(page: VideoPage, path: '/videos', name: 'information_pepites'),
    AutoRoute(
        page: NewsLettersPage, path: '/newsletters', name: 'concepts_pepites'),

    // Drawer routes
    AutoRoute(page: UserProfilePage, path: '/account', name: 'Profile')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  String get routeName => getRouteName(current.name);
}
