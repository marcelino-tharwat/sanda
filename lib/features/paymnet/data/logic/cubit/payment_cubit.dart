import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/features/paymnet/data/model/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  List<PaymentCardModel> paymentCards = [];

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void getAllPaymentCard() {
    paymentCards = CacheHelper().getPaymentCardList();
    emit(PaymentSuccess(paymentCardsList: paymentCards));
  }

  Future<void> addPaymentCard(PaymentCardModel paymentCard) async {
    PaymentCardModel newPaymentCard = PaymentCardModel(
      cardHolderName: cardHolderNameController.text,
      cardNumber: cardNumberController.text,
      cvv: cvvController.text,
      expiryDate: expiryDateController.text,
    );

    List<PaymentCardModel> currentPaymentCards =
        CacheHelper().getPaymentCardList();

    currentPaymentCards.add(newPaymentCard);

    await CacheHelper().savePaymentCardList(currentPaymentCards);

    getAllPaymentCard();
  }

  Future<void> deletePaymentCard(PaymentCardModel paymentCard) async {
    List<PaymentCardModel> currentPaymentCards = CacheHelper().getPaymentCardList();
    currentPaymentCards.removeWhere((e) =>
        e.cardHolderName == paymentCard.cardHolderName &&
        e.cardNumber == paymentCard.cardNumber &&
        e.cvv == paymentCard.cvv &&
        e.expiryDate == paymentCard.expiryDate);
    await CacheHelper().savePaymentCardList(currentPaymentCards);
    getAllPaymentCard();
  }

}
