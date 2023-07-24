import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/lysric_repo/lysric_services.dart';
import 'package:musixmatch/repo/lysric_repo/model/track_lysric_model.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';
import 'package:musixmatch/repo/trending_repo/trending_repo.dart';

part 'lysric_event.dart';
part 'lysric_state.dart';

class LysricBloc extends Bloc<LysricEvent, LysricState> {
  LysricBloc() : super(LysricInitial()) {
    on<LysricEvent>((event, emit) async {
      if (event is LyriscFetch) {
        try {
          emit(LysricLoading());
          final res = await TrackService.getTrack(event.trackId);
          TrackModel? track;
          res.fold((l) => emit(LysricError(getErrorMessage(l))), (r) {
            track = r;
          });
          if (track != null) {
            // fetch lysric now
            final result = await LysricService.fetchLysric(event.trackId);
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
