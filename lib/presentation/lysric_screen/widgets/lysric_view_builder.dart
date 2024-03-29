import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';
import 'package:musixmatch/core/widgets/track_image_widget.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_lysric_model.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_model.dart';

import '../../../core/utils/share_utils.dart';
import '../../../core/widgets/liked_fav_widget.dart';
import '../../../core/widgets/value_builder_widget.dart';

class LysricViewBuilder extends StatelessWidget {
  final TrackModel trackModel;
  final TrackLyriscModel lyriscModel;

  const LysricViewBuilder(
      {super.key, required this.trackModel, required this.lyriscModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    trackModel.trackName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700),
                  )),
                ],
              ),
            ),
          ),
          const Center(child: TrackImageWidget()),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ValueBuilderWidget(
              title: 'Album Name',
              value: trackModel.albumName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ValueBuilderWidget(
              title: 'Artist Name',
              value: trackModel.artistName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      ShareUtils.shareLink(trackModel.trackShareUrl,
                          "I am listening to this track,you will love this.");
                    },
                    icon: const Icon(Icons.share, color: Colors.white)),
                SizedBox(
                  width: 150.w,
                  child: FavStateWidget(
                    trackRating: trackModel.trackRating,
                    numFav: trackModel.numFavourite,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              lyriscModel.lyricsBody,
              style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}
