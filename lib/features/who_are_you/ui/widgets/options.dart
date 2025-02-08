import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensure equal spacing
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 150.h,
              child: Card(
                color: ColorsManager.mainBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                elevation: 4, // Adds a shadow
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Donor",
                      style: TextStyles.font14wightGrayBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(Routes.signUpScreen),
            child: SizedBox(
              height: 150.h,
              child: Card(
                color: ColorsManager.mainBlue,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                elevation: 4, // Adds a shadow
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "I don't have an account yet",
                      style: TextStyles.font14wightGrayBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
