import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/home/data/model/category.dart';
import 'package:sanda/features/home/logic/category_cubit.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => index < 3
                ? context
                    .read<CategoryCubit>()
                    .getServiceByCategory(categoryName: categories[index].title)
                : context.read<CategoryCubit>().getAllProduct(),
            child: Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 0)
                  : EdgeInsets.only(left: 8.w),
              child: SizedBox(
                width: 70.w,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.w,
                      backgroundImage: AssetImage(categories[index].image),
                    ),
                    verticalSpace(10.h),
                    Text(
                      maxLines: 2,
                      categories[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyles.font12darkGrayRegular,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
