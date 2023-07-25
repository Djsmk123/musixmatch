// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/utils/bookmark/bookmarks_method.dart';
import 'package:musixmatch/core/widgets/error_widget.dart';
import 'package:musixmatch/core/widgets/loading_widget.dart';
import 'package:musixmatch/presentation/bookmarked_screen/bloc/bookmark_bloc.dart';
import 'package:musixmatch/presentation/lysric_screen/bloc/lysric_bloc.dart';
import 'package:musixmatch/presentation/lysric_screen/widgets/lysric_view_builder.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_lysric_model.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_model.dart';

@RoutePage(name: 'LyricsView')
class LyricsScreen extends StatefulWidget {
  final String trackId;

  const LyricsScreen({super.key, required this.trackId});

  @override
  State<LyricsScreen> createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  bool isBookmarked = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<LysricBloc>(context).add(LyriscFetch(widget.trackId));
      checkBookMark(widget.trackId, (value) {
        isBookmarked = value;
        setState(() {});
      });
    });
    //check is bookmarked or not

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            BlocSelector<LysricBloc, LysricState, TrackModel?>(
              selector: (state) => state is LysricLoaded ? (state.track) : null,
              builder: (context, state) {
                if (state != null) {
                  return IconButton(
                    icon: Icon(
                      isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: !isBookmarked ? Colors.white : Colors.yellow,
                    ),
                    onPressed: () {
                      isBookmarked
                          ? removeBookMark(state.trackId.toString(), () {
                              setState(() {
                                isBookmarked = false;
                              });
                            })
                          : addBookmark(state.trackId.toString(),
                              state.trackName.toString(), () {
                              setState(() {
                                isBookmarked = true;
                              });
                            });
                      // update bookmarks state
                      BlocProvider.of<BookmarkBloc>(context)
                          .add(BookmarkFetchEvent());
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
          title: const Text(
            "Track details",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<LysricBloc, LysricState>(
          builder: (c, state) {
            if (state is LysricLoading) {
              return const LoadingWidget();
            }
            if (state is LysricError) {
              return CustomErrorWidget(
                msg: state.message,
                hasBackOption: true,
              );
            }
            if (state is LysricLoaded) {
              TrackModel trackModel = state.track;
              TrackLyriscModel lyriscModel = state.lyriscModel;
              return LysricViewBuilder(
                trackModel: trackModel,
                lyriscModel: lyriscModel,
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
