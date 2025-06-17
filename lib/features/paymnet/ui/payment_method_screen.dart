import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/paymnet/data/logic/cubit/payment_cubit.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/add_new_card_form.dart';
import 'package:sanda/features/paymnet/ui/widget/payment_card.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    cubit.getAllPaymentCard();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsManager.mainBlue,
          onPressed: () {
            cubit.cardNumberController.clear();
            cubit.expiryDateController.clear();
            cubit.cardHolderNameController.clear();
            cubit.cvvController.clear();
            showModalBottomSheet(
              backgroundColor: ColorsManager.wight,
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: cubit,
                  child: const AddNewCardForm(),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: ColorsManager.wight,
          ),
        ),
        appBar: AppBar(
          leading: const BackButton(
            color: ColorsManager.mainBlue,
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorsManager.wight,
          title: Text(
            "Payment Methods",
            style: TextStyles.font24mainBlueBold,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your payment cards",
                  style: TextStyles.font16MainBlueXtraBold,
                ),
                verticalSpace(10),
                Expanded(
                  child: BlocBuilder<PaymentCubit, PaymentState>(
                    builder: (context, state) {
                      if (cubit.paymentCards.isEmpty) {
                        return Center(
                          child: Text(
                            'No payment cards found!',
                            style: TextStyles.font18DarkGrayBold
                                .copyWith(color: ColorsManager.errorRed),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: cubit.paymentCards.length,
                        itemBuilder: (context, index) => PaymentCard(
                          paymentCard: cubit.paymentCards[index],
                          onChanged: (value) {
                            for (var card in cubit.paymentCards) {
                              card.isSelected = false;
                            }
                            cubit.paymentCards[index].isSelected =
                                value ?? false;
                            cubit.emit(PaymentUpdate());
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
