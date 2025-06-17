import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class SpecialOfferContainer extends StatelessWidget {
  const SpecialOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 70.h,
        maxHeight: 110.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorsManager.mainBlue,
          width: 1.5,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // تحديد إذا كان الشاشة صغيرة
          bool isSmallScreen = constraints.maxWidth < 320.w;
          
          return Row(
            children: [
              // النص
              Expanded(
                flex: isSmallScreen ? 3 : 2,
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 8.w : 12.w),
                  child: Text(
                    "As someone truly special, you deserve our help and we are happy to give it.",
                    style: TextStyles.font12GreenXtraBold.copyWith(
                      color: ColorsManager.mainBlue,
                      fontSize: isSmallScreen ? 10.sp : 12.sp,
                    ),
                    maxLines: isSmallScreen ? 4 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              
              // الخط الفاصل
              Container(
                width: 1.w,
                height: constraints.maxHeight * 0.7,
                color: ColorsManager.mainBlue.withOpacity(0.3),
                margin: EdgeInsets.symmetric(vertical: 16.h),
              ),
              
              // الصورة
              Expanded(
                flex: isSmallScreen ? 2 : 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  child: Container(
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/PHOTO-2025-02-23-23-04-41.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[400],
                            size: 30.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}