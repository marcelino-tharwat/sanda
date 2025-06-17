part of 'order_cubit.dart';

@immutable
sealed class OrderState {
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
final OrderResModel orderResModel;

  OrderSuccess({required this.orderResModel});
}

final class ListOrderSuccess extends OrderState {
  final List<UserOrderResModel> orders;
  ListOrderSuccess(this.orders);
}
final class ListUserOrderSuccess extends OrderState {
  final List<UserOrderResModel> orders;
  ListUserOrderSuccess(this.orders);
}
final class OrderFailure extends OrderState {
  final String errMessage;
  OrderFailure(this.errMessage);
}
  final class OrderCancelSuccess extends OrderState {
  final String message;
  OrderCancelSuccess(this.message);

}
