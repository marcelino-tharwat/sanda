import 'package:dio/dio.dart';

abstract class ApiErrorHandler {
  String errorMessage;
  ApiErrorHandler(
    this.errorMessage,
  );
}

class ServerError extends ApiErrorHandler {
  ServerError(super.errorMessage);

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.error) {
      case DioExceptionType.connectionTimeout:
        return ServerError('connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerError('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerError('receive timeout');
      case DioExceptionType.badCertificate:
        return ServerError('bad certificate');
      case DioExceptionType.badResponse:
        return ServerError.fromBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerError('request cancelled');
      case DioExceptionType.connectionError:
        return ServerError('connection error');
      case DioExceptionType.unknown:
        return ServerError('unknown');
      default:
        return ServerError('opps there was an error , please try later');
    }
  }

  factory ServerError.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('your request not fond ,please try later');
    } else if (statusCode == 500) {
      return ServerError('internal server error , please try later ');
    } else {
      return ServerError("opps therer was an error, try again ");
    }
  }
}
