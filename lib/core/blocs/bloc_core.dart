// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/presentation/bookmarked_screen/bloc/bookmark_bloc.dart';
import 'package:musixmatch/presentation/home_screen/bloc/trending_bloc.dart';
import 'package:musixmatch/presentation/lysric_screen/bloc/lysric_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => TrendingBloc()),
    BlocProvider(create: (context) => LysricBloc()),
    BlocProvider(create: (create) => BookmarkBloc())
  ];
}
