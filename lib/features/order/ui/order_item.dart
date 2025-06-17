import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';

class OrderItem extends StatelessWidget {
  final UserOrderResModel order;

  const OrderItem({super.key, required this.order});

  // دالة مساعدة لتنظيف الكود
  Color _getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return ColorsManager.orange;
      case "Accepted":
        return ColorsManager.mainBlue;
      case "Done":
        return ColorsManager.green;
      default:
        return ColorsManager.errorRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);

    return Container(
      padding: EdgeInsets.all(12.w), // تقليل الـ padding قليلاً
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة العناصر من الأعلى
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              'assets/images/reading.jpg',
              fit: BoxFit.cover,
              height: 90.h, // تقليل حجم الصورة قليلاً
              width: 90.w,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        order.name,
                        maxLines: 2, 
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14DarkGrayBold.copyWith(
                          fontWeight: FontWeightHelper.semi_bold,
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        order.status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(6),
                // تحسين عرض التفاصيل باستخدام أيقونات
                _buildInfoRow(Icons.person_outline, order.userName),
                verticalSpace(4),
                _buildInfoRow(Icons.location_on_outlined, order.location),
                verticalSpace(4),
                _buildInfoRow(Icons.phone_outlined, order.phoneNumber, isLast: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(IconData icon, String text, {bool isLast = false}) {
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: ColorsManager.gray),
        horizontalSpace(6),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyles.font14darkGrayRegular.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}