import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/auth/sign_up/ui/widgets/input_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24mainBlueBold.copyWith(height: 1.9),
                ),
                Text(
                  'Create an account and explore features designed for accessibility and comfort. Welcome to our community!',
                  style: TextStyles.font14darkGrayRegular.copyWith(height: 1.6),
                ),
                verticalSpace(16),
                const InputFiled(),
                verticalSpace(16),
                AppTextButton(
                  bottonText: "Create Account",
                  onPressed: () {},
                ) 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
