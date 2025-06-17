// lib/features/home/ui/widgets/dialog_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    AddressModel addressModel = CacheHelper.getDefaultAddress();
    var cubitController = context.read<OrderCubit>();

    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          Navigator.pop(context); // Close the bottom sheet
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Order placed successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is OrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          // Accommodate the keyboard
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: ColorsManager.wight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle for bottom sheet
                  Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  verticalSpace(24),
                  Text('Place Order for $name', style: TextStyles.font18DarkGrayBold),
                  verticalSpace(20),
                  AppFormTextFiled(
                    hintText: "Phone Number",
                    controller: cubitController.phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  verticalSpace(20),
                  AppFormTextFiled(
                    hintText: "Comment (optional)",
                    controller: cubitController.commentController,
                  ),
                  verticalSpace(20),
                  _buildAddressContainer(context, addressModel),
                  verticalSpace(30),
                  AppTextButton(
                    bottonText: 'Confirm Order',
                    onPressed: ()=>  context.read<OrderCubit>().makeOrder(name),
                    // isLoading: isLoading, // Pass loading state to the button
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddressContainer(BuildContext context, AddressModel addressModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorsManager.wightGray,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping Address", style: TextStyles.font14MainBlueXtraBold),
              TextButton(
                onPressed: () => GoRouter.of(context).push(Routes.chooseShippingAddress),
                child: Text("Change", style: TextStyles.font14MainBlueXtraBold),
              ),
            ],
          ),
          verticalSpace(4),
          Text(addressModel.address, style: TextStyles.font14GrayRegular),
          verticalSpace(4),
          Text("${addressModel.city}, ${addressModel.zipCode}", style: TextStyles.font14GrayRegular),
        ],
      ),
    );
  }
}