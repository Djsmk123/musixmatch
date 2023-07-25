import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/musixmatch_repo/data_sources/musixmatch_service.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_model.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<TrendingEvent>((event, emit) async {
      if (event is TrendingLoadTracks) {
        emit(TrendingLoading());
        final res = await MusixMatchService.getTracks();
        res.fold((l) => emit(TrendingError(message: getErrorMessage(l))), (r) {
          r.isNotEmpty ? emit(TrendingLoaded(r)) : emit(TrendingEmpty());
        });
      }
    });
  }
}
