import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/ui/widgets/dialog_card.dart';
import 'package:sanda/features/home/ui/widgets/heart_icon.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categoriesList;
  const CategoryGrid({
    super.key,
    required this.categoriesList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Text(categoriesList[0].category,
              style: TextStyles.font14MainBlueXtraBold),
        ),
        verticalSpace(8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.w,
            mainAxisSpacing: 20.h,
            childAspectRatio: 0.9, // تم تعديل هذه القيمة لزيادة الارتفاع
          ),
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            // Determine if the current category is a product
            bool isProduct = categoriesList[index].category == "Groceries" ||
                categoriesList[index].category == "Supermarket" ||
                categoriesList[index].category == "Pharmacy";

            return Container(
              width: 150.w,
              height: 150.h, // تم زيادة الارتفاع هنا
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 6.r,
                    spreadRadius: 2.r,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                    child: Image.asset(
                      categoriesList[index].image ??
                          "assets/images/attendantcare.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150.h, // تم زيادة الارتفاع هنا
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 125,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 42.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(categoriesList[index].name,
                            style: TextStyles.font12DarkGraySemiBold),
                      ),
                    ),
                  ),
                  const HeartIcon(),
                  // Add the cart button here
                  Positioned(
                    right: 8.w,
                    bottom: 8.h,
                    child: GestureDetector(
                      onTap: () {
                        // Handle cart button tap
                        log('Cart button tapped for ${categoriesList[index].name}');
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: ColorsManager.mainBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: isProduct
                            ? Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 12.r,
                              )
                            : GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: ColorsManager.wight,
                                    context: context,
                                    builder: (context) {
                                      return const DialogCard();
                                    },
                                  );
                                },
                                child: Text('Order',
                                    style: TextStyles.font12WhiteRegular),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
