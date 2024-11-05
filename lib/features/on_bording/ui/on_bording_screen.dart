import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Bringing Ease to every movement",
                style: TextStyles.font32mainBlueBold.copyWith(height: 1.2.h),
                textAlign: TextAlign.center,
              ),
              verticalSpace(10),
              Text(
                "Making independent living simple , safe , and accessible for seniors and people with disabilities",
                style: TextStyles.font12darkGrayRegular.copyWith(height: 1.2.h),
                textAlign: TextAlign.center,
              ),
              verticalSpace(43),
              AppTextButton(
                bottonText: "Getting Started",
                onPressed: () {
                  context.go(Routes.whoAreYouScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
