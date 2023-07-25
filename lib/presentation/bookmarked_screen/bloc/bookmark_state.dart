part of 'bookmark_bloc.dart';

@immutable
abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<Bookmark> bookmarks;
  BookmarkLoaded(this.bookmarks);
}

class BookmarkError extends BookmarkState {
  final String message;

  BookmarkError(this.message);
}

class BookmarkLoading extends BookmarkState {}

class BookmarkEmpty extends BookmarkState {}
