import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';

import '../../../repo/trending_repo/trending_repo.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<TrendingEvent>((event, emit) async {
      if (event is TrendingLoadTracks) {
        emit(TrendingLoading());
        final res = await TrackService.getTrending();
        res.fold((l) => emit(TrendingError(message: getErrorMessage(l))), (r) {
          r.isNotEmpty ? emit(TrendingLoaded(r)) : emit(TrendingEmpty());
        });
      }
    });
  }
}
