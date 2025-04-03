import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/cart/ui/widget/cart_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // الجزء القابل للتمرير
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: Column(
                  children: [
                    Text(
                      'Cart',
                      style: TextStyles.font13mainBlueRegular
                          .copyWith(fontWeight: FontWeightHelper.extra_bold),
                    ),
                    verticalSpace(30),
                    ListView.builder(
                        shrinkWrap: true, // Add this line
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    height: 52.h,
                                    width: 52.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.r),
                                      ),
                                      child: Image.asset(
                                        'assets/images/nursing.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  horizontalSpace(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nursing',
                                        style: TextStyles.font13BlckRegular
                                            .copyWith(
                                                fontWeight:
                                                    FontWeightHelper.Bold),
                                      ),
                                      Text(
                                        'Home Assistance',
                                        style: TextStyles.font12darkGrayRegular
                                            .copyWith(
                                                fontWeight:
                                                    FontWeightHelper.Bold),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  const CartButtons(),
                                ],
                              ),
                              index == 4 ?  const SizedBox.shrink() : const Divider(),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
            // الجزء الثابت (Checkout)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Items',
                        style: TextStyles.font13darkGrayRegular
                            .copyWith(fontWeight: FontWeightHelper.Bold),
                      ),
                      const Spacer(),
                      Text(
                        '0.00',
                        style: TextStyles.font13blackRegular
                            .copyWith(fontWeight: FontWeightHelper.Bold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: TextStyles.font13darkGrayRegular
                            .copyWith(fontWeight: FontWeightHelper.Bold),
                      ),
                      const Spacer(),
                      Text(
                        '0.00',
                        style: TextStyles.font13blackRegular
                            .copyWith(fontWeight: FontWeightHelper.Bold),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  AppTextButton(
                    bottonText: 'Checkout',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
