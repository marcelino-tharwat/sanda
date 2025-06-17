import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/profile/logic/cubit/adress/address_cubit.dart';
import 'package:sanda/features/profile/ui/widgets/address_item.dart';

class ChooseShippingAddress extends StatefulWidget {
  const ChooseShippingAddress({super.key});

  @override
  State<ChooseShippingAddress> createState() => _ChooseShippingAddressState();
}

class _ChooseShippingAddressState extends State<ChooseShippingAddress> {
  @override
  void initState() {
    super.initState();
    // نحمل العناوين من الكاش عن طريق الكيوبت
    context.read<AddressCubit>().loadAddresses();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddressCubit>();
    return Scaffold(
      appBar: AppBar(
                leading: const BackButton(color: ColorsManager.mainBlue,),

        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsManager.wight,
        title: Text(
          "Shipping Address",
          style: TextStyles.font24mainBlueBold.copyWith(
            fontWeight: FontWeightHelper.extra_bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.mainBlue,
        onPressed: () async {
          await GoRouter.of(context).push(
            Routes.addShippingAddress,
            extra: null,
          );
          cubit.loadAddresses();
        },
        child: const Icon(
          Icons.add,
          color: ColorsManager.wight,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    verticalSpace(20),
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        if (cubit.addresses.isEmpty) {
                          return Center(
                            child: Text(
                              'No addresses found!',
                              style: TextStyles.font18DarkGrayBold,
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.addresses.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddressItem(
                                  isSelected: cubit.selectedAddress ==
                                      cubit.addresses[index],
                                  onChanged: (bool? value) {
                                    cubit.selectAddress(cubit.addresses[index]);
                                    CacheHelper.saveDefaultAddress(
                                        cubit.addresses[index]);
                                    print(cubit.addresses[index].toJson());
                                  },
                                  addressModel: cubit.addresses[index],
                                ),
                                verticalSpace(15)
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
