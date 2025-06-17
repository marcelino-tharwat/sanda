import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/paymnet/data/logic/cubit/payment_cubit.dart';
import 'package:sanda/features/paymnet/data/model/payment_model.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key, required this.paymentCard, required this.onChanged});

  final PaymentCardModel paymentCard;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: double.infinity, // Add width constraint
      child: Column(
        children: [
          CreditCardWidget(
            padding: 0,
            cardNumber: paymentCard.cardNumber,
            expiryDate: paymentCard.expiryDate,
            cardHolderName: paymentCard.cardHolderName,
            cvvCode: paymentCard.cvv,
            showBackView: false,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
          ),
          // Instead of Row + CheckboxListTile, use Row with Checkbox and Text
          Row(
            children: [
              Checkbox(
                value: paymentCard.isSelected,
                onChanged: onChanged,
                checkColor: ColorsManager.wight,
                activeColor: ColorsManager.green,
              ),
              Expanded(
                child: Text(
                  'Use as the shipping address',
                  style: TextStyles.font12darkGrayRegular,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: ColorsManager.errorRed),
                onPressed: () {
                  context.read<PaymentCubit>().deletePaymentCard(paymentCard);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
