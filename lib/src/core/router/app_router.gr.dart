// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Authentification.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
      );
    },
    Accueil.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserHomePage(),
      );
    },
    Telechargements.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DownloadsPage(),
      );
    },
    Talents_pepites.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PodcastPage(),
      );
    },
    Information_pepites.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const VideoPage(),
      );
    },
    Concepts_pepites.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NewsLettersPage(),
      );
    },
    Profile.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          Authentification.name,
          path: '/auth',
        ),
        RouteConfig(
          Accueil.name,
          path: '/',
        ),
        RouteConfig(
          Telechargements.name,
          path: '/downloads',
        ),
        RouteConfig(
          Talents_pepites.name,
          path: '/podcasts',
        ),
        RouteConfig(
          Information_pepites.name,
          path: '/videos',
        ),
        RouteConfig(
          Concepts_pepites.name,
          path: '/newsletters',
        ),
        RouteConfig(
          Profile.name,
          path: '/account',
        ),
      ];
}

/// generated route for
/// [AuthenticationPage]
class Authentification extends PageRouteInfo<void> {
  const Authentification()
      : super(
          Authentification.name,
          path: '/auth',
        );

  static const String name = 'Authentification';
}

/// generated route for
/// [UserHomePage]
class Accueil extends PageRouteInfo<void> {
  const Accueil()
      : super(
          Accueil.name,
          path: '/',
        );

  static const String name = 'Accueil';
}

/// generated route for
/// [DownloadsPage]
class Telechargements extends PageRouteInfo<void> {
  const Telechargements()
      : super(
          Telechargements.name,
          path: '/downloads',
        );

  static const String name = 'Telechargements';
}

/// generated route for
/// [PodcastPage]
class Talents_pepites extends PageRouteInfo<void> {
  const Talents_pepites()
      : super(
          Talents_pepites.name,
          path: '/podcasts',
        );

  static const String name = 'Talents_pepites';
}

/// generated route for
/// [VideoPage]
class Information_pepites extends PageRouteInfo<void> {
  const Information_pepites()
      : super(
          Information_pepites.name,
          path: '/videos',
        );

  static const String name = 'Information_pepites';
}

/// generated route for
/// [NewsLettersPage]
class Concepts_pepites extends PageRouteInfo<void> {
  const Concepts_pepites()
      : super(
          Concepts_pepites.name,
          path: '/newsletters',
        );

  static const String name = 'Concepts_pepites';
}

/// generated route for
/// [UserProfilePage]
class Profile extends PageRouteInfo<void> {
  const Profile()
      : super(
          Profile.name,
          path: '/account',
        );

  static const String name = 'Profile';
}
