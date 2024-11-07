import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/styles.dart';

class TermsAndCondtions extends StatelessWidget {
  const TermsAndCondtions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: 'By logging, you agree to our',
              style: TextStyles.font13darkGrayRegular),
          TextSpan(
              text: ' Terms & Conditions',
              style: TextStyles.font13blackRegular),
          TextSpan(text: ' and', style: TextStyles.font13darkGrayRegular),
          TextSpan(
              text: ' PrivacyPolicy.',
              style: TextStyles.font13blackRegular.copyWith(height: 1.4.h)),
        ],
      ),
    );
  }
}
