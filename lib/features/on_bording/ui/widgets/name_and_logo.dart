import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndLogo extends StatelessWidget {
  const NameAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80.h,
        width: 160.w,
        child: Image.asset(
          'assets/images/loco_and_name.png',
          fit: BoxFit.contain,
        ));
  }
}
