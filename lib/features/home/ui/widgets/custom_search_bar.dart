import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const  CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      height: 37.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyles.font14DarkGray,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                ColorsManager.darkGray,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/search.png',
                width: 16.w,
                height: 16.h,
              ),
            ),
          ),
          filled: true,
          fillColor: const Color(0xffF3F3F3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
        ),
      ),
    );
  }
}
