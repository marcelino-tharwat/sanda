import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/styles.dart';

class DisableImageAndText extends StatelessWidget {
  const DisableImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            bottom: 100.h,
            left: 0.h,
            right: 0.h,
            child: Image.asset(
              'assets/images/outline_logo.png',
            ),
          ),
          Container(
            height: 490.h,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.19, 0.4]),
            ),
            child: Image.asset('assets/images/disable.png'),
          ),
          Positioned(
            bottom: 10.h,
            left: 0.h,
            right: 0.h,
            child: Text(
              "Bringing Ease to every movement",
              style: TextStyles.font32mainBlueBold.copyWith(height: 1.2.h),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
