part of 'lysric_bloc.dart';

@immutable
abstract class LysricEvent {}

class LyriscFetch extends LysricEvent {
  final String trackId;

  LyriscFetch(this.trackId);
}
