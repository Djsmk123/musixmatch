import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/bookmark_repo/data_source/bookmark_service.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';

Future<void> checkBookMark(
    String trackId, Function(bool isBookmarked) onSuccess) async {
  final res = BookMarkService.getBookmarkById(trackId);
  res.fold((l) => log(getErrorMessage(l)), (r) {
    onSuccess(r != null);
  });
}

Future<void> addBookmark(
    String trackId, String trackName, Function() onSuccess) async {
  try {
    EasyLoading.show(status: 'loading...');
    final res = await BookMarkService.addBookmark(
        Bookmark(trackId: int.parse(trackId), trackName: trackName));
    res.fold((l) => throw (l), (r) {
      onSuccess();
      EasyLoading.showSuccess("Bookmarked successfully");
    });
  } catch (e) {
    EasyLoading.showError("Something went wrong");
  }
}

Future<void> removeBookMark(String trackId, Function() onSuccess) async {
  try {
    EasyLoading.show(status: 'loading...');
    final res = await BookMarkService.removeBookmark(trackId.toString());
    res.fold((l) => throw (l), (r) {
      onSuccess();
      EasyLoading.showSuccess("Bookmarked removed successfully");
    });
  } catch (e) {
    EasyLoading.showError("Something went wrong");
  }
}
