import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/musixmatch_repo/data_sources/musixmatch_service.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_lysric_model.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_model.dart';

part 'lysric_event.dart';
part 'lysric_state.dart';

class LysricBloc extends Bloc<LysricEvent, LysricState> {
  LysricBloc() : super(LysricInitial()) {
    on<LysricEvent>((event, emit) async {
      if (event is LyriscFetch) {
        try {
          emit(LysricLoading());
          final res = await MusixMatchService.getTrackById(event.trackId);
          TrackModel? track;
          res.fold((l) => emit(LysricError(getErrorMessage(l))), (r) {
            track = r;
          });
          if (track != null) {
            // fetch lysric now
            final result = await MusixMatchService.fetchLysric(event.trackId);
            result.fold((l) => emit(LysricError(getErrorMessage(l))), (r) {
              emit(LysricLoaded(track!, r));
            });
          }
        } catch (e) {
          emit(LysricError(getErrorMessage(ServerFailure())));
        }
      }
    });
  }
}
