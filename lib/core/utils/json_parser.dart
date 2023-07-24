import 'dart:convert';

import 'package:musixmatch/core/errors/exceptions.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

mixin JsonParsers {
  Either<Failure, Map<String, dynamic>> parseJson(String json) {
    try {
      final data = jsonDecode(json);
      return Right(data);
    } catch (e) {
      return Left(JsonFailure());
    }
  }
}
