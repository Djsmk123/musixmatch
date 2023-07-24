import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:musixmatch/core/services/network/network_info.dart';
import 'package:musixmatch/repo/lysric_repo/model/track_lysric_model.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/services/network/network_util.dart';
import '../../core/utils/env.dart';

class LysricService {
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
