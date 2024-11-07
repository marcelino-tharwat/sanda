import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/core/widgets/app_text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: TextStyles.font24mainBlueBold.copyWith(height: 1.9),
            ),
            Text(
              'Forgot your password? No worries! Let’s help you get back in securely.',
              style: TextStyles.font14darkGrayRegular.copyWith(height: 1.6),
            ),
            verticalSpace(30),
            const AppFormTextFiled(hintText: 'Email'),
            const Spacer(),
            AppTextButton(
              bottonText: 'Reset Password',
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
