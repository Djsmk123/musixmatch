// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:musixmatch/presentation/bookmarked_screen/pages/bookmarks_screen.dart'
    as _i1;
import 'package:musixmatch/presentation/home_screen/pages/home_screen.dart'
    as _i2;
import 'package:musixmatch/presentation/lysric_screen/pages/lysric_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BookmarkView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookMarkScreen(),
      );
    },
    TrendingView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(),
      );
    },
    LyricsView.name: (routeData) {
      final args = routeData.argsAs<LyricsViewArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LyricsScreen(
          key: args.key,
          trackId: args.trackId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BookMarkScreen]
class BookmarkView extends _i4.PageRouteInfo<void> {
  const BookmarkView({List<_i4.PageRouteInfo>? children})
      : super(
          BookmarkView.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class TrendingView extends _i4.PageRouteInfo<void> {
  const TrendingView({List<_i4.PageRouteInfo>? children})
      : super(
          TrendingView.name,
          initialChildren: children,
        );

  static const String name = 'TrendingView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LyricsScreen]
class LyricsView extends _i4.PageRouteInfo<LyricsViewArgs> {
  LyricsView({
    _i5.Key? key,
    required String trackId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LyricsView.name,
          args: LyricsViewArgs(
            key: key,
            trackId: trackId,
          ),
          initialChildren: children,
        );

  static const String name = 'LyricsView';

  static const _i4.PageInfo<LyricsViewArgs> page =
      _i4.PageInfo<LyricsViewArgs>(name);
}

class LyricsViewArgs {
  const LyricsViewArgs({
    this.key,
    required this.trackId,
  });

  final _i5.Key? key;

  final String trackId;

  @override
  String toString() {
    return 'LyricsViewArgs{key: $key, trackId: $trackId}';
  }
}
