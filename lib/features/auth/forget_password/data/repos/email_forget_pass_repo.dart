import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_req_model.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_res_model.dart';

class EmailForgetPassRepo {
  final ApiService apiService;

  EmailForgetPassRepo({required this.apiService});
  Future<Either<ApiErrorHandler, EmailForgetPassResModel>> emailForgetPass(
      {required EmailForgetPassReqModel emailForgetPassReqModel}) async {
    try {
      var response = await apiService.forgetPassword(emailForgetPassReqModel);
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
