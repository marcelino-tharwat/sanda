import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/home/data/model/category_model.dart';

class CategoryRepo {
  final ApiService apiService;
  CategoryRepo({required this.apiService});
  Future<Either<ApiErrorHandler, List<CategoryModel>>> getCategory(
      {required String categoryName}) async {
    try {
      var response = await apiService.getCategory(categoryName);
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
