import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class AppFormTextFiled extends StatelessWidget {
  final String hintText;
  final bool? isObscured;
  final Widget? suffixIcon;
  const AppFormTextFiled(
      {super.key, required this.hintText, this.isObscured, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.wightGray,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.wightGray),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.wightGray),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: TextStyles.font14GrayRegular,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscured ?? false,
    );
  }
}
