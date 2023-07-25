import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:musixmatch/core/errors/exceptions.dart';
import 'package:musixmatch/core/services/network/network_info.dart';
import 'package:musixmatch/core/utils/env.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_lysric_model.dart';
import 'package:musixmatch/repo/musixmatch_repo/models/track_model.dart';

import '../../../core/errors/failures.dart';
import '../../../core/services/network/network_util.dart';

class MusixMatchService {
  static Future<Either<Failure, List<TrackModel>>> getTracks() async {
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

  static Future<Either<Failure, TrackModel>> getTrackById(
      String trackId) async {
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

  static Future<Either<Failure, TrackLyriscModel>> fetchLysric(
      String trackId) async {
    try {
      final res = await NetworkInfoImpl().getRequest(
          endpoint: 'track.lyrics.get',
          queryParam: QueryParam(
              params: {'apikey': EnvUtils.fetchAPI(), 'track_id': trackId}));
      return res.fold((l) => Left(l), (r) {
        final dynamic data = r.message.body;
        return Right(TrackLyriscModel.fromJson(data['lyrics']));
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
