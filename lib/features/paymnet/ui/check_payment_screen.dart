import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/paymnet/data/logic/validarion_card.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_utils.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  ),
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    textColor: Colors.black,
                    cardNumberDecoration: const InputDecoration(
                      labelText: 'Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      // border: border,
                    ),
                    expiryDateDecoration: const InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      labelText: 'Card Holder Name',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  verticalSpace( 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          processCardPayment();
                        }
                      },
                      bottonText: 'Pay',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void processCardPayment() {
    // First check against static database
    if (CardValidator.checkStaticCardData(
      cardNumber,
      expiryDate,
      cardHolderName,
      cvvCode,
    )) {
      // Success - card found in static database
      DialogUtils.showSuccessDialog(context, cardNumber);
    } else if (CardValidator.validateCard(
      cardNumber,
      expiryDate,
      cardHolderName,
      cvvCode,
    )) {
      // Card passed basic validation but not in static database
      DialogUtils.showCardNotRecognizedDialog(context);
    } else {
      // Card failed validation
      DialogUtils.showInvalidCardDialog(context);
    }
  }
}
