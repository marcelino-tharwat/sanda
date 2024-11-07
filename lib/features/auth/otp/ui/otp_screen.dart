import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/auth/otp/ui/widgets/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyles.font24mainBlueBold.copyWith(height: 1.9),
                  ),
                  Text(
                    "Add a PIN number to make your account more secure and easy to sign in.",
                    style:
                        TextStyles.font14darkGrayRegular.copyWith(height: 1.6),
                  ),
                  // const SizedBox(height: 16),
                  //  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  verticalSpace(50),
                  const OtpForm(),
                  verticalSpace(16),

                  Text(
                    "Resend OTP Code",
                    style: TextStyles.font12mainBlueRegular,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.49),

                  verticalSpace(24),
                  AppTextButton(
                    bottonText: 'Continue',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
