// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:musixmatch/core/errors/exceptions.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';

class BookMarkService {
  static Future<Either<Failure, bool>> openHiveBox() async {
    try {
      await Hive.openBox<Bookmark>('bookmarks');
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(StorageFailure());
    }
  }

  static Either<Failure, List<Bookmark>> getBookmarks() {
    try {
      final box = Hive.box<Bookmark>('bookmarks');
      List<Bookmark> bookmarks = box.values.toList();
      return Right(bookmarks); // Return Right in case of success
    } catch (e) {
      return Left(StorageFailure());
    }
  }

  static Either<Failure, Bookmark?> getBookmarkById(String trackId) {
    try {
      var bookmarks = getBookmarks();
      return bookmarks.fold((l) => Left(l), (r) {
        return Right(r.firstWhereOrNull(
            (element) => element.trackId.toString() == trackId));
      });
    } catch (e) {
      log(e.toString());
      return Left(StorageFailure());
    }
  }

  static Future<Either<Failure, bool>> addBookmark(Bookmark bookmark) async {
    try {
      final box = Hive.box<Bookmark>('bookmarks');
      await box.add(bookmark);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(StorageFailure());
    }
  }

  static Future<Either<Failure, bool>> removeBookmark(String trackId) async {
    try {
      final box = Hive.box<Bookmark>('bookmarks');
      final Map<dynamic, Bookmark> deliveriesMap = box.toMap();
      dynamic desiredKey;
      deliveriesMap.forEach((key, value) {
        if (value.trackId.toString() == trackId) {
          desiredKey = key;
        }
      });
      await box.delete(desiredKey);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(StorageFailure());
    }
  }
}
