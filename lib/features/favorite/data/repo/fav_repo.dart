import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/favorite/data/model/add_fav_res_model.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';

class FavRepo {
  final ApiService apiService;

  FavRepo({required this.apiService});

  Future<Either<ApiErrorHandler, AddFavResModel>> addFavService({
    required int userId,
    required int productId,
  }) async {
    try {
      var response = await apiService.addFavService(userId, productId);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  Future<Either<ApiErrorHandler, List<FavListResModel>>> getUserFavServices({
    required int userId,
  }) async {
    try {
      var response = await apiService.getUserFavServices(userId);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  Future<Either<ApiErrorHandler, String>> deleteFavService({
    required int userId,
    required int productId,
  }) async {
    try {
      var response = await apiService.deleteFavService(userId, productId);
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
