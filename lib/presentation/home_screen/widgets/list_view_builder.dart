import 'package:flutter/material.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';

import 'list_card_builder.dart';

class TrackListViewBuilder extends StatelessWidget {
  final List<TrackModel> tracks;
  const TrackListViewBuilder({super.key, required this.tracks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tracks.length,
          shrinkWrap: true,
          itemBuilder: (c, index) {
            TrackModel trackModel = tracks[index];
            return CardTrackBuilderWidget(trackModel: trackModel);
          }),
    );
  }
}
