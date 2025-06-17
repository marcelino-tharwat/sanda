import 'package:dio/dio.dart';

abstract class ApiErrorHandler {
  String errorMessage;
  ApiErrorHandler(this.errorMessage);
}

class ServerError extends ApiErrorHandler {
  ServerError(super.errorMessage);

  factory ServerError.fromDioError(DioException dioError) {
    // تغيير من dioError.error إلى dioError.type
    switch (dioError.type) {
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
        return ServerError('oops there was an error, please try later');
    }
  }

  factory ServerError.fromBadResponse(int statusCode, dynamic response) {

    
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      String message = _extractMessage(response);
      return ServerError(message);
    } else if (statusCode == 404) {
      return ServerError('your request not found, please try later');
    } else if (statusCode == 500) {
      return ServerError('internal server error, please try later');
    } else {
      return ServerError("oops there was an error, try again");
    }
  }

  // دالة مساعدة لاستخراج الرسالة بأمان
  static String _extractMessage(dynamic response) {
    try {
      if (response == null) {
        return 'Unknown error occurred';
      }

      if (response is Map<String, dynamic>) {
        if (response.containsKey('message') && response['message'] != null) {
          return response['message'].toString();
        }
        if (response.containsKey('Message') && response['Message'] != null) {
          return response['Message'].toString();
        }
        if (response.containsKey('error') && response['error'] != null) {
          return response['error'].toString();
        }
        if (response.containsKey('msg') && response['msg'] != null) {
          return response['msg'].toString();
        }
        return response.toString();
      }

      if (response is String && response.isNotEmpty) {
        return response;
      }

      return response.toString();
    } catch (e) {
      return 'Error processing server response';
    }
  }
}