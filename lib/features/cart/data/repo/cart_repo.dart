import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/cart/data/model/product_card_model.dart';

class CartRepo {
  final ApiService apiService;

  CartRepo({required this.apiService});

  ///add to cart
  Future<Either<ApiErrorHandler, String>> addToCart(
      int productId, int userId) async {
    try {
      var response = await apiService.addToCart(productId, userId);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  ///remove from cart
  Future<Either<ApiErrorHandler, String>> removeFromCart(
      int productId, int userId) async {
    try {
      var response = await apiService.removeFromCart(productId, userId);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  ///get cart
  Future<Either<ApiErrorHandler, List<ProductCardModel>>> getCart(
      int userId) async {
    try {
      var response = await apiService.getCart(userId);
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
