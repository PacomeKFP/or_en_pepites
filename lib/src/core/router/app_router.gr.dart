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
    AuthenticationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
      );
    },
    UserHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserHomePage(),
      );
    },
    DownloadsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DownloadsPage(),
      );
    },
    PodcastsListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PodcastsListPage(),
      );
    },
    PodcastDetailsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PodcastDetailsPage(),
      );
    },
    VideosListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const VideosListPage(),
      );
    },
    VideoDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VideoDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VideoDetailsPage(
          key: args.key,
          video: args.video,
        ),
      );
    },
    NewsLetterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsLetterDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewsLetterDetailsPage(
          key: args.key,
          title: args.title,
          content: args.content,
        ),
      );
    },
    NewsLettersListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NewsLettersListPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
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
        ),
        RouteConfig(
          DownloadsRoute.name,
          path: '/downloads',
        ),
        RouteConfig(
          PodcastsListRoute.name,
          path: '/podcasts',
        ),
        RouteConfig(
          PodcastDetailsRoute.name,
          path: '/podcasts/read',
        ),
        RouteConfig(
          VideosListRoute.name,
          path: '/videos',
        ),
        RouteConfig(
          VideoDetailsRoute.name,
          path: '/videos/watch',
        ),
        RouteConfig(
          NewsLetterDetailsRoute.name,
          path: '/newsletters/read',
        ),
        RouteConfig(
          NewsLettersListRoute.name,
          path: '/newsletters',
        ),
        RouteConfig(
          UserProfileRoute.name,
          path: '/account',
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
class DownloadsRoute extends PageRouteInfo<void> {
  const DownloadsRoute()
      : super(
          DownloadsRoute.name,
          path: '/downloads',
        );

  static const String name = 'DownloadsRoute';
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
class PodcastDetailsRoute extends PageRouteInfo<void> {
  const PodcastDetailsRoute()
      : super(
          PodcastDetailsRoute.name,
          path: '/podcasts/read',
        );

  static const String name = 'PodcastDetailsRoute';
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
    required Video video,
  }) : super(
          VideoDetailsRoute.name,
          path: '/videos/watch',
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

  final Video video;

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
          path: '/newsletters/read',
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
