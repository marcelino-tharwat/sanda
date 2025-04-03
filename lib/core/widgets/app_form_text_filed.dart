import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class AppFormTextFiled extends StatelessWidget {
  final String hintText;
  final bool? isObscured;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? colorTextFiled;
  final String? Function(String?)? validator;

  const AppFormTextFiled(
      {super.key,
      required this.hintText,
      this.isObscured,
      this.suffixIcon,
      this.controller,
      this.validator,
      this.keyboardType,
      this.colorTextFiled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: colorTextFiled ?? ColorsManager.wightGray,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        focusedBorder: OutlineInputBorder(
          borderSide:
               BorderSide(color:colorTextFiled ?? ColorsManager.wightGray, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
               BorderSide(color: colorTextFiled ??ColorsManager.wightGray, width: 1.3),
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
      controller: controller,
      validator: validator != null ? (value) => validator!(value) : null,
      keyboardType: keyboardType,
    );
  }
}
