import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/routing/routing_dat.gr.dart';

import '../../../core/widgets/liked_fav_widget.dart';
import '../../../core/widgets/rounded_button.dart';
import '../../../core/widgets/value_builder_widget.dart';
import '../../../repo/musixmatch_repo/models/track_model.dart';

class CardTrackBuilderWidget extends StatelessWidget {
  final TrackModel trackModel;
  const CardTrackBuilderWidget({super.key, required this.trackModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(LyricsView(trackId: trackModel.trackId.toString()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                    child: Text(
                  trackModel.trackName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ))
              ],
            ),
            ValueBuilderWidget(
              title: 'Album name',
              value: trackModel.albumName,
            ),
            ValueBuilderWidget(
              title: 'Artist name',
              value: trackModel.artistName,
            ),
            FavStateWidget(
              trackRating: trackModel.trackRating,
              numFav: trackModel.numFavourite,
            ),
            if (trackModel.hasLyrics == 1)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRoundedButton(
                        height: 30.h,
                        width: 120.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Details",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                            const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        )),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
