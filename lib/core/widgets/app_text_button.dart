import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String bottonText;
  final VoidCallback onPressed;
  final Color? color;
  const AppTextButton({
    super.key,
    required this.bottonText,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? ColorsManager.mainBlue,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        ),
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 50.h)),
      ),
      child: Text(bottonText, style: TextStyles.font14wightBold),
    );
  }
}
