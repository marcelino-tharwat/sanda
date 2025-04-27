import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/spacer.dart';
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
      cubit.fullNameController.text = addressModel!.fullName;
      cubit.addressController.text = addressModel!.address;
      cubit.cityController.text = addressModel!.city;
      cubit.zipCodeController.text = addressModel!.zipCode;
      cubit.countryController.text = addressModel!.country;
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
                    AppFormTextFiled(
                      hintText: 'Full Name',
                      controller: cubit.fullNameController,
                    ),
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
                    AppFormTextFiled(
                      hintText: 'Country',
                      controller: cubit.countryController,
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      bottonText: addressModel == null
                          ? 'Save Address'
                          : 'Update Address',
                      onPressed: () async {
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
