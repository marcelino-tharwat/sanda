import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class SpecialOfferContainer extends StatelessWidget {
  const SpecialOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorsManager.green,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 171.w,
            height: 80.h,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h),
              child: Text(
                  "As someone truly special, you deserve our help and we are happy to give it.",
                  style: TextStyles.font12GreenXtraBold),
            ),
          ),
          Container(
            width: 1.w,
            height: 80.h,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            child: SizedBox(
              width: 166.w,
              height: 111.h,
              child: Image.asset(
                'assets/images/PHOTO-2025-02-23-23-04-41.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
