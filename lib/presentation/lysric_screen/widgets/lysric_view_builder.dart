import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';
import 'package:musixmatch/repo/lysric_repo/model/track_lysric_model.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';

import '../../../core/utils/share_utils.dart';
import '../../../core/widgets/value_builder_widget.dart';
import '../../home_screen/widgets/list_card_builder.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trackModel.trackName,
                    style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg")),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          offset: const Offset(0, 25),
                          blurRadius: 3,
                          spreadRadius: -10)
                    ],
                  ),
                ),
              ),
            ),
          ),
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
          Text(
            lyriscModel.lyricsBody,
            style: TextStyle(
                color: CustomColors.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
