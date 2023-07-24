// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/core/widgets/error_widget.dart';
import 'package:musixmatch/core/widgets/loading_widget.dart';
import 'package:musixmatch/presentation/lysric_screen/bloc/lysric_bloc.dart';
import 'package:musixmatch/presentation/lysric_screen/widgets/lysric_view_builder.dart';
import 'package:musixmatch/repo/bookmark_repo/bookmark_service.dart';
import 'package:musixmatch/repo/lysric_repo/model/track_lysric_model.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';

import '../../repo/bookmark_repo/model/bookmark_track.dart';

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
      checkBookMark();
    });
    //check is bookmarked or not

    super.initState();
  }

  Future<void> checkBookMark() async {
    final res = BookMarkService.getBookmarkById(widget.trackId);
    res.fold((l) => log(getErrorMessage(l)), (r) {
      isBookmarked = r != null;
    });
    setState(() {});
  }

  Future<void> addBookmark(String trackId, String trackName) async {
    try {
      EasyLoading.show(status: 'loading...');
      final res = await BookMarkService.addBookmark(
          Bookmark(trackId: int.parse(trackId), trackName: trackName));
      res.fold((l) => throw (l), (r) {
        isBookmarked = true;
        EasyLoading.showSuccess("Bookmarked successfully");
      });
    } catch (e) {
      EasyLoading.showError("Something went wrong");
    }

    setState(() {});
  }

  Future<void> removeBookMark(String trackId) async {
    try {
      EasyLoading.show(status: 'loading...');
      final res = await BookMarkService.removeBookmark(trackId.toString());
      res.fold((l) => throw (l), (r) {
        isBookmarked = false;
        EasyLoading.showSuccess("Bookmarked removed successfully");
      });
    } catch (e) {
      EasyLoading.showError("Something went wrong");
    }

    setState(() {});
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
                          ? removeBookMark(state.trackId.toString())
                          : addBookmark(state.trackId.toString(),
                              state.trackName.toString());
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
              return CustomErrorWidget(msg: state.message);
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
