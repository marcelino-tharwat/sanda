import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_req_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_res_model.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo({required this.apiService});
  Future<Either<ApiErrorHandler, SignUpResModel>> signUp(
      {required SignUpReqModel signUpReqModel}) async {
    try {
      var response = await apiService.signUp(signUpReqModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }
}
