part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartSuccess extends CartState {
  final List<ProductCardModel> productList;

  GetCartSuccess({required this.productList});
}

final class AddToCartSuccess extends CartState {
  final String message;

  AddToCartSuccess({required this.message});
}

final class RemoveFromCartSuccess extends CartState {
  final String message;

  RemoveFromCartSuccess({required this.message});
}

final class CartFailed extends CartState {
  final String errorMessage;

  CartFailed({required this.errorMessage});
}

final class CartLoading extends CartState {}
