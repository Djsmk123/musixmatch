import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/bookmark_repo/data_source/bookmark_service.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<BookmarkEvent>((event, emit) async {
      if (event is BookmarkFetchEvent) {
        emit(BookmarkLoading());
        final res = BookMarkService.getBookmarks();
        res.fold(
            (l) => emit(BookmarkError(getErrorMessage(l))),
            (r) =>
                r.isNotEmpty ? emit(BookmarkLoaded(r)) : emit(BookmarkEmpty()));
      }
    });
  }
}
