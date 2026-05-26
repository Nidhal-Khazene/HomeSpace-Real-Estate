import 'package:dio/dio.dart';

class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class LocalFailure extends Failures {
  LocalFailure({required super.errMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException e) => switch (e.type) {
    DioExceptionType.connectionTimeout => ServerFailure(
      errMessage: "Connection timeout with API Server",
    ),
    DioExceptionType.sendTimeout => ServerFailure(
      errMessage: "Send timeout with API Server",
    ),
    DioExceptionType.receiveTimeout => ServerFailure(
      errMessage: "Receive timeout with API Server",
    ),
    DioExceptionType.badCertificate => ServerFailure(
      errMessage: "Bad certificate from API Server",
    ),
    DioExceptionType.badResponse => ServerFailure.fromBadResponse(
      e.response!.statusCode!,
      e.response!.statusMessage!,
    ),
    DioExceptionType.cancel => ServerFailure(
      errMessage: "Request to API Server was cancelled",
    ),
    DioExceptionType.connectionError => ServerFailure(
      errMessage: "Check your internet connection, please.",
    ),
    DioExceptionType.unknown => ServerFailure(
      errMessage: "Oops! There was an error, please try again.",
    ),
  };

  factory ServerFailure.fromBadResponse(int statusCode, String statusMessage) {
    if (statusCode == 404) {
      return ServerFailure(
        errMessage: "Your request was not found, please try later.",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: "There is a problem with the server, please try later.",
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: statusMessage);
    } else {
      return ServerFailure(errMessage: "There was an error, please try again.");
    }
  }
}
