import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';

class TextStyles {
  static TextStyle font32mainBlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font12darkGrayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.darkGray,
  );
    static TextStyle font14wightBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
