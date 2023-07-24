part of 'trending_bloc.dart';

@immutable
abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<TrackModel> tracks;
  TrendingLoaded(this.tracks);
}

class TrendingLoading extends TrendingState {}

class TrendingEmpty extends TrendingState {}

class TrendingError extends TrendingState {
  final String message;
  TrendingError({required this.message});
}
