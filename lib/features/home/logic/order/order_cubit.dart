import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/features/home/data/model/order_req_model.dart';
import 'package:sanda/features/home/data/model/order_res_model.dart';
import 'package:sanda/features/home/data/repo/order_repo.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  final OrderRepo orderRepo;

  TextEditingController addressController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Future<void> makeOrder(String name) async {
    if (isClosed) return;
    emit(OrderLoading());
    AddressModel addressModel = CacheHelper.getDefaultAddress();
    OrderReqModel orderReqModel = OrderReqModel(
      userId: userId,
      name: name,
      location:
          "${addressModel.address} ${addressModel.city} ${addressModel.zipCode}",
      comment: commentController.text,
      phoneNumber: phoneNumberController.text,
    );

    var result = await orderRepo.makeOrder(orderReqModel);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(OrderFailure(failure.errorMessage));
      },
      (orderResModel) {
        if (!isClosed) emit(OrderSuccess(orderResModel: orderResModel));
      },
    );
  }

  Future<void> getAllUserOrder(int userId) async {
    if (isClosed) return;
    emit(OrderLoading());
    var result = await orderRepo.getAllUserOrder(userId: userId);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(OrderFailure(failure.errorMessage));
      },
      (orderResModel) {
        if (!isClosed) emit(ListUserOrderSuccess(orderResModel));
      },
    );
  }

  Future<void> deleteOrder(int orderId) async {
    if (isClosed) return;
    emit(OrderLoading());
    var result = await orderRepo.deleteOrder(orderId: orderId);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(OrderFailure(failure.errorMessage));
      },
      (succMessage) {
        if (!isClosed) emit(OrderCancelSuccess(succMessage));
      },
    );
  }
}
