import 'package:flutter/material.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';

import 'bookmark_card_builder.dart';

class ListViewBuilderBookmarks extends StatelessWidget {
  final List<Bookmark> bookmarks;

  const ListViewBuilderBookmarks({super.key, required this.bookmarks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, index) {
        Bookmark bookmark = bookmarks[index];
        return BookmarkCardWidget(
          bookmark: bookmark,
        );
      },
      itemCount: bookmarks.length,
    );
  }
}
