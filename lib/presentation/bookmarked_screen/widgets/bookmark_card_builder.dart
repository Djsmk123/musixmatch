// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/utils/bookmark/bookmarks_method.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';
import 'package:musixmatch/routing/routing_dat.gr.dart';

import '../../../core/widgets/track_image_widget.dart';

class BookmarkCardWidget extends StatelessWidget {
  final Bookmark bookmark;
  const BookmarkCardWidget({super.key, required this.bookmark});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        removeBookmark(bookmark.trackId, context);
      },
      child: InkWell(
        onTap: () async {
          context.router.push(LyricsView(trackId: bookmark.trackId.toString()));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TrackImageWidget(
                height: 60.h,
                width: 60.w,
                shape: BoxShape.circle,
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                  child: Text(
                bookmark.trackName,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void removeBookmark(int id, context) {
    removeBookMark(id.toString(), () {});
  }
}
