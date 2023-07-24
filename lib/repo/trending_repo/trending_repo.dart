import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:musixmatch/core/errors/exceptions.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/core/services/network/network_info.dart';
import 'package:musixmatch/core/services/network/network_util.dart';
import 'package:musixmatch/repo/trending_repo/models/trending_item_model.dart';

import '../../core/utils/env.dart';

class TrackService {
  static Future<Either<Failure, List<TrackModel>>> getTrending() async {
    try {
      final res = await NetworkInfoImpl().getRequest(
          endpoint: 'chart.tracks.get',
          queryParam: QueryParam(params: {'apikey': EnvUtils.fetchAPI()}));
      return res.fold((l) => Left(l), (r) {
        final dynamic data = r.message.body;
        List<TrackModel> tracks = List<TrackModel>.from(
            data['track_list'].map((e) => TrackModel.fromJson(e['track'])));
        return Right(tracks);
      });
    } on Failure catch (err) {
      log(err.toString());
      return Left(err);
    } catch (err) {
      log(err.toString());
      return Left(EndpointFailure(message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, TrackModel>> getTrack(String trackId) async {
    try {
      final res = await NetworkInfoImpl().getRequest(
          endpoint: 'track.get',
          queryParam: QueryParam(
              params: {'apikey': EnvUtils.fetchAPI(), 'track_id': trackId}));
      return res.fold((l) => Left(l), (r) {
        final dynamic data = r.message.body;

        return Right(TrackModel.fromJson(data['track']));
      });
    } on Failure catch (err) {
      log(err.toString());
      return Left(err);
    } catch (err) {
      log(err.toString());
      return Left(EndpointFailure(message: "Something went wrong"));
    }
  }
}
