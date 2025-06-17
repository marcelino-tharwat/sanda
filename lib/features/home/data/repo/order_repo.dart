import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:sanda/core/networking/api_error_handler.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/features/home/data/model/order_req_model.dart';
import 'package:sanda/features/home/data/model/order_res_model.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';

class OrderRepo {
  final ApiService apiService;
  OrderRepo(this.apiService);

  Future<Either<ApiErrorHandler, OrderResModel>> makeOrder(
      OrderReqModel orderReqModel) async {
    try {
      var response = await apiService.makeOrder(orderReqModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }

  Future<Either<ApiErrorHandler, List<UserOrderResModel>>> getAllUserOrder(
      {required int userId}) async {
    try {
      var response = await apiService.getAllUserOrder(userId);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        return Left(ServerError(e.toString()));
      }
    }
  }
  Future<Either<ApiErrorHandler, String>> deleteOrder(
      {required int orderId}) async {
    try {
      var response = await apiService.deleteOrder(orderId);
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
