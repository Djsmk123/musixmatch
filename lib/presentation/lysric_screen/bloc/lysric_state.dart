part of 'lysric_bloc.dart';

@immutable
abstract class LysricState {}

class LysricInitial extends LysricState {}

class LysricLoaded extends LysricState {
  final TrackModel track;
  final TrackLyriscModel lyriscModel;
  LysricLoaded(this.track, this.lyriscModel);
}

class LysricLoading extends LysricState {}

class LysricError extends LysricState {
  final String message;
  LysricError(this.message);
}
