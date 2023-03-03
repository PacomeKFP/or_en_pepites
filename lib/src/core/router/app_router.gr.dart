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
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.checkAuthState,
  }) : super(navigatorKey);

  final CheckAuthState checkAuthState;

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
        transitionsBuilder: TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserHomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UserHomePage(),
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DownloadsRoute.name: (routeData) {
      final args = routeData.argsAs<DownloadsRouteArgs>(
          orElse: () => const DownloadsRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DownloadsPage(key: args.key),
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PodcastsListRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PodcastsListPage(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PodcastDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PodcastDetailsRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: PodcastDetailsPage(
          key: args.key,
          podcast: args.podcast,
        ),
        transitionsBuilder: TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideosListRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const VideosListPage(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VideoDetailsRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: VideoDetailsPage(
          key: args.key,
          video: args.video,
        ),
        transitionsBuilder: TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewsLetterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsLetterDetailsRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: NewsLetterDetailsPage(
          key: args.key,
          title: args.title,
          content: args.content,
        ),
        transitionsBuilder: TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewsLettersListRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NewsLettersListPage(),
        transitionsBuilder: TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
        transitionsBuilder: TransitionsBuilders.slideRight,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>(
          orElse: () => const HistoryRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: HistoryPage(key: args.key),
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavoritesRoute.name: (routeData) {
      final args = routeData.argsAs<FavoritesRouteArgs>(
          orElse: () => const FavoritesRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: FavoritesPage(key: args.key),
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthenticationRoute.name,
          path: '/auth',
        ),
        RouteConfig(
          UserHomeRoute.name,
          path: '/',
          guards: [checkAuthState],
        ),
        RouteConfig(
          DownloadsRoute.name,
          path: '/downloads',
          guards: [checkAuthState],
        ),
        RouteConfig(
          PodcastsListRoute.name,
          path: '/podcasts',
          guards: [checkAuthState],
        ),
        RouteConfig(
          PodcastDetailsRoute.name,
          path: '/podcasts/read/',
          guards: [checkAuthState],
        ),
        RouteConfig(
          VideosListRoute.name,
          path: '/videos',
          guards: [checkAuthState],
        ),
        RouteConfig(
          VideoDetailsRoute.name,
          path: '/videos/watch/',
          guards: [checkAuthState],
        ),
        RouteConfig(
          NewsLetterDetailsRoute.name,
          path: '/newsletters/read/',
          guards: [checkAuthState],
        ),
        RouteConfig(
          NewsLettersListRoute.name,
          path: '/newsletters',
          guards: [checkAuthState],
        ),
        RouteConfig(
          UserProfileRoute.name,
          path: '/account',
          guards: [checkAuthState],
        ),
        RouteConfig(
          HistoryRoute.name,
          path: '/history',
          guards: [checkAuthState],
        ),
        RouteConfig(
          FavoritesRoute.name,
          path: '/favorite',
          guards: [checkAuthState],
        ),
      ];
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute()
      : super(
          AuthenticationRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthenticationRoute';
}

/// generated route for
/// [UserHomePage]
class UserHomeRoute extends PageRouteInfo<void> {
  const UserHomeRoute()
      : super(
          UserHomeRoute.name,
          path: '/',
        );

  static const String name = 'UserHomeRoute';
}

/// generated route for
/// [DownloadsPage]
class DownloadsRoute extends PageRouteInfo<DownloadsRouteArgs> {
  DownloadsRoute({Key? key})
      : super(
          DownloadsRoute.name,
          path: '/downloads',
          args: DownloadsRouteArgs(key: key),
        );

  static const String name = 'DownloadsRoute';
}

class DownloadsRouteArgs {
  const DownloadsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DownloadsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PodcastsListPage]
class PodcastsListRoute extends PageRouteInfo<void> {
  const PodcastsListRoute()
      : super(
          PodcastsListRoute.name,
          path: '/podcasts',
        );

  static const String name = 'PodcastsListRoute';
}

/// generated route for
/// [PodcastDetailsPage]
class PodcastDetailsRoute extends PageRouteInfo<PodcastDetailsRouteArgs> {
  PodcastDetailsRoute({
    Key? key,
    required PodcastModel podcast,
  }) : super(
          PodcastDetailsRoute.name,
          path: '/podcasts/read/',
          args: PodcastDetailsRouteArgs(
            key: key,
            podcast: podcast,
          ),
        );

  static const String name = 'PodcastDetailsRoute';
}

class PodcastDetailsRouteArgs {
  const PodcastDetailsRouteArgs({
    this.key,
    required this.podcast,
  });

  final Key? key;

  final PodcastModel podcast;

  @override
  String toString() {
    return 'PodcastDetailsRouteArgs{key: $key, podcast: $podcast}';
  }
}

/// generated route for
/// [VideosListPage]
class VideosListRoute extends PageRouteInfo<void> {
  const VideosListRoute()
      : super(
          VideosListRoute.name,
          path: '/videos',
        );

  static const String name = 'VideosListRoute';
}

/// generated route for
/// [VideoDetailsPage]
class VideoDetailsRoute extends PageRouteInfo<VideoDetailsRouteArgs> {
  VideoDetailsRoute({
    Key? key,
    required VideoModel video,
  }) : super(
          VideoDetailsRoute.name,
          path: '/videos/watch/',
          args: VideoDetailsRouteArgs(
            key: key,
            video: video,
          ),
        );

  static const String name = 'VideoDetailsRoute';
}

class VideoDetailsRouteArgs {
  const VideoDetailsRouteArgs({
    this.key,
    required this.video,
  });

  final Key? key;

  final VideoModel video;

  @override
  String toString() {
    return 'VideoDetailsRouteArgs{key: $key, video: $video}';
  }
}

/// generated route for
/// [NewsLetterDetailsPage]
class NewsLetterDetailsRoute extends PageRouteInfo<NewsLetterDetailsRouteArgs> {
  NewsLetterDetailsRoute({
    Key? key,
    required String title,
    required String content,
  }) : super(
          NewsLetterDetailsRoute.name,
          path: '/newsletters/read/',
          args: NewsLetterDetailsRouteArgs(
            key: key,
            title: title,
            content: content,
          ),
        );

  static const String name = 'NewsLetterDetailsRoute';
}

class NewsLetterDetailsRouteArgs {
  const NewsLetterDetailsRouteArgs({
    this.key,
    required this.title,
    required this.content,
  });

  final Key? key;

  final String title;

  final String content;

  @override
  String toString() {
    return 'NewsLetterDetailsRouteArgs{key: $key, title: $title, content: $content}';
  }
}

/// generated route for
/// [NewsLettersListPage]
class NewsLettersListRoute extends PageRouteInfo<void> {
  const NewsLettersListRoute()
      : super(
          NewsLettersListRoute.name,
          path: '/newsletters',
        );

  static const String name = 'NewsLettersListRoute';
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute()
      : super(
          UserProfileRoute.name,
          path: '/account',
        );

  static const String name = 'UserProfileRoute';
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({Key? key})
      : super(
          HistoryRoute.name,
          path: '/history',
          args: HistoryRouteArgs(key: key),
        );

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({Key? key})
      : super(
          FavoritesRoute.name,
          path: '/favorite',
          args: FavoritesRouteArgs(key: key),
        );

  static const String name = 'FavoritesRoute';
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key}';
  }
}
