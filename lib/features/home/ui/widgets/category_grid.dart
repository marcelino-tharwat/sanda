import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/favorite/logic/fav_cubit.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/home/ui/widgets/dialog_card.dart';
import 'package:sanda/features/home/ui/widgets/heart_icon.dart';

class CategoryGrid extends StatelessWidget {
  final List<ProductOrServiceModel> categoriesList;
  const CategoryGrid({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              categoriesList.isNotEmpty ? categoriesList[0].category : 'Items',
              style: TextStyles.font14MainBlueXtraBold,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.9,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              final item = categoriesList[index];
              final bool isFavorite =
                  context.read<FavCubit>().isFavorite(item.id);

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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: item.image != null && item.image!.isNotEmpty
                              ? Image.memory(
                                  base64Decode(item.image!),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  gaplessPlayback: true,
                                )
                              : Image.asset(
                                  "assets/images/attendantcare.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                        ),
                        _buildGradient(),
                        Positioned(
                          top: 8.w,
                          right: 8.w,
                          child: HeartIcon( item),
                        ),
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
                                    item.name,
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
                                        create: (context) =>
                                            getIt<OrderCubit>(),
                                        child: DialogCard(name: item.name),
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
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
      ),
    );
  }
}
