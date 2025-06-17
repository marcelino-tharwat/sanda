import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/home/ui/widgets/dialog_card.dart';
import 'package:sanda/features/home/ui/widgets/heart_icon.dart';

class FavGrid extends StatelessWidget {
  final List<FavListResModel> favList;
  const FavGrid({super.key, required this.favList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.9,
          ),
          itemCount: favList.length,
          itemBuilder: (context, index) {
            final item = favList[index];
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              elevation: 4.0,
              shadowColor: Colors.black.withOpacity(0.1),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: item.serviceImage != null &&
                                item.serviceImage!.isNotEmpty
                            ? Image.memory(
                                base64Decode(item.serviceImage!),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                gaplessPlayback: true,
                              )
                            : Image.asset(
                                "assets/images/attendantcare.jpg", // Fallback image
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                      _buildGradient(),
                      _buildCardContent(context, item),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.4),
              Colors.transparent
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, FavListResModel item) {
    final serviceName = item.serviceName ?? 'Unnamed Service';

    return Stack(
      children: [
        Positioned(top: 8.w, right: 8.w, child: HeartIcon(item,)),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.serviceName!,
                    style: TextStyles.font14wightBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => BlocProvider(
                        create: (context) => getIt<OrderCubit>(),
                        child: DialogCard(name: serviceName),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      color: ColorsManager.mainBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.receipt_long,
                      color: ColorsManager.wight,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
