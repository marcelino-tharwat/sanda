import 'package:flutter/material.dart';
import 'package:sanda/core/theming/styles.dart';

class AlredyHaveAccount extends StatelessWidget {
  const AlredyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account yet? ",
            style: TextStyles.font13BlckRegular,
          ),
          TextSpan(
            text: "Login",
            style: TextStyles.font13mainBlueRegular,
          ),
        ],
      ),
    );
  }
}
