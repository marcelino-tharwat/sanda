import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';
import 'package:sanda/features/profile/logic/cubit/adress/address_cubit.dart';

class AddShippingAddressScreen extends StatelessWidget {
  final AddressModel? addressModel;

  const AddShippingAddressScreen({super.key, this.addressModel});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddressCubit>();
    if (addressModel != null) {
      cubit.addressController.text = addressModel!.address;
      cubit.cityController.text = addressModel!.city;
      cubit.zipCodeController.text = addressModel!.zipCode;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    AppBar(
                              leading: const BackButton(color: ColorsManager.mainBlue,),

                      backgroundColor: Colors.transparent,
                      titleTextStyle: TextStyles.font24mainBlueBold
                          .copyWith(fontWeight: FontWeightHelper.extra_bold),
                      title: Text(
                        addressModel == null
                            ? 'Add Shipping Address'
                            : 'Edit Shipping Address',
                      ),
                    ),
                    verticalSpace(20),

                    verticalSpace(20),
                    AppFormTextFiled(
                      hintText: 'Address',
                      controller: cubit.addressController,
                    ),
                    verticalSpace(20),
                    AppFormTextFiled(
                      hintText: 'City',
                      controller: cubit.cityController,
                    ),
                    verticalSpace(20),
                    AppFormTextFiled(
                        hintText: 'Zip Code(Postal Code)',
                        controller: cubit.zipCodeController,
                        keyboardType: TextInputType.number),
                    verticalSpace(20),

                    verticalSpace(20),
                    AppTextButton(
                      bottonText: addressModel == null
                          ? 'Save Address'
                          : 'Update Address',
                      onPressed: () async {
                        AddressModel defaultaddressModel = AddressModel(
                          address: cubit.addressController.text,
                          city: cubit.cityController.text,
                          zipCode: cubit.zipCodeController.text
                        );
                        CacheHelper.saveDefaultAddress( defaultaddressModel);
                        await cubit.saveOrUpdateAddress(
                            existingAddress: addressModel);
                        GoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
