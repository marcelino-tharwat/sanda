import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/paymnet/data/logic/cubit/payment_cubit.dart';
import 'package:sanda/features/paymnet/data/logic/validarion_card.dart';
import 'package:sanda/features/paymnet/data/model/payment_model.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_utils.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/add_card_title.dart';

class AddNewCardForm extends StatelessWidget {
  const AddNewCardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PaymentCubit>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddCardTitle(),
            verticalSpace(20),
            // Make sure you initialized formKey in PaymentCubit and use it here.
            Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  AppFormTextFiled(
                    hintText: 'Name on card',
                    controller: cubit.cardHolderNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the card holder name';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(12),
                  AppFormTextFiled(
                    hintText: 'Card number',
                    controller: cubit.cardNumberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the card number';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(12),
                  AppFormTextFiled(
                    hintText: 'Expire Date',
                    keyboardType: TextInputType.number,
                    controller: cubit.expiryDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the expiration date';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(12),
                  AppFormTextFiled(
                    hintText: 'CVV',
                    keyboardType: TextInputType.number,
                    controller: cubit.cvvController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the CVV';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextButton(
                    bottonText: "Add Card",
                    onPressed: () {
                      // Make sure form is validated first
                      if (cubit.formKey.currentState!.validate()) {
                        processCardPayment(context, cubit);
                      } else {
                        // Show some error if form is invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields correctly'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void processCardPayment(BuildContext context, PaymentCubit cubit) {
    String cardNumber = cubit.cardNumberController.text;
    String expiryDate = cubit.expiryDateController.text;
    String cardHolderName = cubit.cardHolderNameController.text;
    String cvvCode = cubit.cvvController.text;



    if (CardValidator.validateCard(
        cardNumber, expiryDate, cardHolderName, cvvCode)) {
      PaymentCardModel paymentCard = PaymentCardModel(
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        cvv: cvvCode,
        expiryDate: expiryDate,
      );
      cubit.addPaymentCard(paymentCard);
      Navigator.pop(context);
    } else {
      // Card failed validation
      DialogUtils.showInvalidCardDialog(context);
    }
  }
}
