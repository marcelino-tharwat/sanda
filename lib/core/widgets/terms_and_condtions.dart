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
              style: TextStyles.font11darkGrayRegular),
          TextSpan(
              text: ' Terms & Conditions',
              style: TextStyles.font11blackRegular),
          TextSpan(text: ' and', style: TextStyles.font11darkGrayRegular),
          TextSpan(
              text: ' PrivacyPolicy.',
              style: TextStyles.font11blackRegular.copyWith(height: 1.4.h)),
        ],
      ),
    );
  }
}
