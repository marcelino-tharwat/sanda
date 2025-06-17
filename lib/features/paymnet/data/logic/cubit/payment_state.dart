part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final List<PaymentCardModel> paymentCardsList;

  PaymentSuccess({required this.paymentCardsList});
}

final class PaymentUpdate extends PaymentState {}
