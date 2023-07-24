// Import necessary packages and files
import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:musixmatch/core/Model/api_response_model.dart';
import 'package:musixmatch/core/errors/exceptions.dart';
import 'package:musixmatch/core/errors/failures.dart';
import 'package:musixmatch/core/services/network/network_util.dart';
import 'package:musixmatch/core/utils/json_parser.dart';

// Create an abstract class to define the NetworkInfo interface
abstract class NetworkInfo {
  // Define the base URL for the API
  static var url = "https://api.musixmatch.com/ws/1.1/";

  // Define a method to check if the device is connected to the internet
  Future<bool> get isConnected;

  // Define a method to make a GET request to the API
  Future<Either<Failure, ApiResponseModel>> getRequest({
    required String endpoint,
    HttpParam? params,
    HttpHeader? header,
    QueryParam? queryParam,
  });

  // Define a method to make a POST request to the API
  Future<Either<Failure, ApiResponseModel>> postRequest({
    required String endpoint,
    QueryParam? params,
    HttpHeader? header,
    required Map<String, dynamic> body,
  });
}

// Implement the NetworkInfo interface with NetworkInfoImpl class
class NetworkInfoImpl extends NetworkInfo with JsonParsers {
  InternetConnectionCheckerPlus connectionChecker =
      InternetConnectionCheckerPlus();

  // Check if the device is connected to the internet
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  // Make a GET request to the API
  @override
  Future<Either<Failure, ApiResponseModel>> getRequest({
    required String endpoint,
    HttpParam? params,
    HttpHeader? header,
    QueryParam? queryParam,
  }) async {
    final isConnected = await connectionChecker.hasConnection;

    if (isConnected) {
      // Construct the API URL
      var uri = Uri.parse("${NetworkInfo.url}$endpoint");
      if (queryParam != null) {
        uri = uri.replace(queryParameters: queryParam.params);
      }
      log(uri.toString(), name: 'uri');

      // Set default headers if not provided
      header ??= HttpHeader();

      // Send the HTTP GET request
      final response = await http.get(uri, headers: header.headers);

      // Parse the JSON response
      final data = parseJson(response.body);

      return data.fold(
        // If parsing fails, return a JsonFailure
        (l) => Left(JsonFailure()),
        (r) {
          try {
            final ApiResponseModel apiResponseModel =
                ApiResponseModel.fromJson(r);
            if (apiResponseModel.message.header.statusCode == 200) {
              // If the API response has a success status code, return the data
              return Right(apiResponseModel);
            }
            // If the API response has an error status code, throw an EndpointFailure
            throw (EndpointFailure(message: "Invalid Response from server"));
          } on Failure catch (e) {
            // If any other Failure occurs, return it
            return Left(e);
          } catch (e) {
            // Catch any other errors that might occur during processing
            return Left(JsonFailure());
          }
        },
      );
    }
    // If not connected to the internet, return an InternetFailure
    return Left(InternetFailure());
  }

  // Make a POST request to the API
  @override
  Future<Either<Failure, ApiResponseModel>> postRequest({
    required String endpoint,
    QueryParam? params,
    HttpHeader? header,
    required Map<String, dynamic> body,
  }) async {
    try {
      final isConnected = await connectionChecker.hasConnection;
      if (isConnected) {
        // Construct the API URL
        var uri = Uri.parse("${NetworkInfo.url}$endpoint");
        if (params != null) {
          uri = uri.replace(queryParameters: params.params);
        }
        log(uri.toString());

        // Set default headers if not provided
        header ??= HttpHeader();

        // Send the HTTP POST request
        http.Response response = await http
            .post(uri, headers: header.headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 30), onTimeout: () {
          // Handle timeout by returning a custom response
          return http.Response(
              jsonEncode({'success': false, 'message': 'Timeout'}), 500);
        });

        // Parse the JSON response
        final data = parseJson(response.body.toString());

        return data.fold(
          // If parsing fails, return a JsonFailure
          (l) => Left(JsonFailure()),
          (r) {
            final ApiResponseModel apiResponseModel =
                ApiResponseModel.fromJson(r);
            if (apiResponseModel.message.header.statusCode == 200) {
              // If the API response has a success status code, return the data
              return Right(apiResponseModel);
            } else {
              // If the API response has an error status code, return an EndpointFailure
              return Left(
                  EndpointFailure(message: "Invalid response from server"));
            }
          },
        );
      }
      // If not connected to the internet, return an InternetFailure
      return Left(InternetFailure());
    } catch (e) {
      // Catch any errors that might occur during processing and return a ServerFailure
      log(e.toString());
      return Left(ServerFailure());
    }
  }
}
