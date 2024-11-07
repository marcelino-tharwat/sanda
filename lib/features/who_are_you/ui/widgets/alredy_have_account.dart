import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/styles.dart';

class AlredyHaveAccount extends StatelessWidget {
  const AlredyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'If you already have an account you can ',
          style: TextStyles.font13BlckRegular,
        ),
        GestureDetector(
          onTap: () {
              GoRouter.of(context)
            .push(Routes.loginScreen);
          },
          child: Text(
            'Login',
            style: TextStyles.font13mainBlueRegular.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
