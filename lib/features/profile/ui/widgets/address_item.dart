import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';
import 'package:sanda/features/profile/logic/cubit/adress/address_cubit.dart';

class AddressItem extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  final AddressModel addressModel;

  const AddressItem({
    super.key,
    required this.isSelected,
    required this.onChanged,
    required this.addressModel,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddressCubit>();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorsManager.wight,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.gray.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    isThreeLine: true,
                    title: Text(
                      addressModel.fullName,
                      style: TextStyles.font14DarkGrayBold
                          .copyWith(color: ColorsManager.darkGray),
                    ),
                    subtitle: Text(
                      "${addressModel.address} ${addressModel.city} ${addressModel.zipCode}",
                      style: TextStyles.font14GrayRegular,
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Use as the shipping address',
                      style: TextStyles.font12darkGrayRegular,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isSelected,
                    onChanged: onChanged,
                    checkColor: ColorsManager.wight,
                    activeColor: ColorsManager.green,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () async {
                    await GoRouter.of(context).push(
                      Routes.addShippingAddress,
                      extra: {
                        'cubit': context.read<AddressCubit>(),
                        'address': addressModel,
                      },
                    );
                  },
                  child: Text(
                    'Edit',
                    style: TextStyles.font13mainBlueRegular,
                  ),
                ),
                verticalSpace(35),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cubit.deleteAddress(addressModel);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
