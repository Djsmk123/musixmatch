import 'package:auto_route/auto_route.dart';
import 'package:musixmatch/routing/routing_dat.gr.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = <CustomRoute>[
    CustomRoute(
      path: '/',
      initial: true,
      page: TrendingView.page,
    ),
    CustomRoute(
      path: '/lyrics',
      page: LyricsView.page,
    ),
    CustomRoute(
      path: '/bookmarks',
      page: BookmarkView.page,
    ),
  ];
}
