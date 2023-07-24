import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/themes/colors.dart';
import 'package:musixmatch/core/widgets/empty_list_widget.dart';
import 'package:musixmatch/core/widgets/error_widget.dart';
import 'package:musixmatch/presentation/home_screen/bloc/trending_bloc.dart';

import 'list_view_builder.dart';

class TrendingSongViewBuilder extends StatefulWidget {
  const TrendingSongViewBuilder({super.key});

  @override
  State<TrendingSongViewBuilder> createState() =>
      _TrendingSongViewBuilderState();
}

class _TrendingSongViewBuilderState extends State<TrendingSongViewBuilder> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TrendingBloc>(context).add(TrendingLoadTracks());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(builder: (c, state) {
      if (state is TrendingLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: CustomColors.primaryColor,
          ),
        );
      }
      if (state is TrendingError) {
        return CustomErrorWidget(msg: state.message);
      }

      if (state is TrendingEmpty) {
        return const EmptyListWidget(
          message: "Please try again later.",
        );
      }
      if (state is TrendingLoaded) {
        return TrackListViewBuilder(
          tracks: state.tracks,
        );
      }
      return const SizedBox.shrink();
    });
  }
}
