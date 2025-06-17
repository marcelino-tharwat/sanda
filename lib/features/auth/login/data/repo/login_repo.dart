import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/auth/login/data/models/login_req_model.dart';
import 'package:sanda/features/auth/login/data/models/login_res_model.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo({required this.apiService});

  Future<Either<ApiErrorHandler, LoginResModel>> login(
      {required LoginReqModel loginReqModel}) async {
    try {
      var response = await apiService.login(loginReqModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }
}
