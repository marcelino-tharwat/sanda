import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';


class UserDataRepo {
  final ApiService apiService;

  UserDataRepo({required this.apiService});
  Future<Either<ApiErrorHandler, UserResponse>> profileData(
      {required int id}) async {
    try {
      var response = await apiService.userData(id); // تمرير الـ id فقط
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  Future<Either<ApiErrorHandler, UserResponse>> updateProfileData(
      {required int id, required UserResponse userResponse}) async {
    try {
      var response = await apiService.updateProfileData(id, userResponse);
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
