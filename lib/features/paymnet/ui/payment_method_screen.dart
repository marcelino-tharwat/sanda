import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/add_new_card_form.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({
    super.key,
  });
  late bool isSelected;
  late ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.mainBlue,
        onPressed: () {
          // return AddNewCardForm();
        },
        child: const Icon(
          Icons.add,
          color: ColorsManager.wight,
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your payment cards",
                style: TextStyles.font18DarkGrayBold,
              ),
              verticalSpace(10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  height: 280.h,
                  child: Column(
                    children: [
                      CreditCardWidget(
                          padding: 0,
                          cardNumber: "1234 1234 1234 1234",
                          expiryDate: "12/24",
                          cardHolderName: "John Doe",
                          cvvCode: "123",
                          showBackView: false,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand brand) {}),
                      CheckboxListTile(
                        dense: true,
                        title: Text(
                          'Use as the shipping address',
                          style: TextStyles.font12darkGrayRegular,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: false,
                        onChanged: (value) {},
                        checkColor: ColorsManager.wight,
                        activeColor: ColorsManager.green,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
