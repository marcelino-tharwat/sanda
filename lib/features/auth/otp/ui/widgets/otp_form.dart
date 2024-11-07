import 'package:flutter/material.dart';
import 'package:sanda/features/auth/otp/ui/widgets/otp_filed.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [OtpFiled(), OtpFiled(), OtpFiled(), OtpFiled()],
          ),
        ],
      ),
    );
  }
}
