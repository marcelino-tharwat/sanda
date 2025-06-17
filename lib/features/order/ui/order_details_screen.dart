import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';

class OrderDetailesScreen extends StatelessWidget {
  const OrderDetailesScreen({super.key, required this.order});
  final UserOrderResModel order;

  @override
  Widget build(BuildContext context) {
    final String currentStatus = order.status;
    final Color statusColor = _getStatusColor(currentStatus);
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderCancelSuccess) {
          context.pop(true);
        }
        if (state is OrderFailure) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('An Error Occurred!'),
              content: Text(state.errMessage),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Okay',
                    style: TextStyles.font12mainBlueRegular,
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details',
              style: TextStyles.font18DarkGrayBold
                  .copyWith(color: ColorsManager.mainBlue)),
          centerTitle: true,
          leading: const BackButton(color: ColorsManager.mainBlue),
          backgroundColor: Colors.white,
          elevation: 0.0,
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Status: ",
                      style: TextStyles.font14DarkGrayBold,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        currentStatus,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeightHelper.semi_bold,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    'assets/images/reading.jpg', // يمكن تغييرها لصورة ديناميكية من الطلب
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(24),

                // عنوان الطلب الرئيسي
                Text(
                  order.name,
                  style: TextStyles.font24mainBlueBold,
                ),
                verticalSpace(5),

                // Text(
                //   'Customer Information',
                //   style: TextStyles.font14DarkGrayBold,
                // ),
                const Divider(height: 20),
                verticalSpace(10),

                _buildDetailRow(
                  icon: Icons.person_outline,
                  title: 'Name',
                  content: order.userName,
                ),
                verticalSpace(12),
                _buildDetailRow(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  content: order.location,
                ),
                verticalSpace(12),
                _buildDetailRow(
                  icon: Icons.phone_outlined,
                  title: 'Phone',
                  content: order.phoneNumber,
                ),
                verticalSpace(12),
                if (order.comment.isNotEmpty)
                  _buildDetailRow(
                    icon: Icons.comment_outlined,
                    title: 'Comment',
                    content: order.comment,
                  ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildActionButtons(context),
      ),
    );
  }

  // ويدجت لعرض صف من التفاصيل مع أيقونة
  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: ColorsManager.mainBlue, size: 22.sp),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.font14DarkGrayBold),
              verticalSpace(2),
              Text(content, style: TextStyles.font14DarkGrayRegular),
            ],
          ),
        ),
      ],
    );
  }

  // منطقة الأزرار في أسفل الشاشة
  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextButton(
            color: ColorsManager.gray.withValues(alpha: 0.7),
            bottonText: 'Cancel Order',
            onPressed: () {
              _showCancelConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Cancellation'),
          content: const Text(
              'Are you sure you want to cancel this order? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Keep Order',
                style: TextStyles.font12mainBlueRegular
                    .copyWith(fontWeight: FontWeightHelper.Bold),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: ColorsManager.gray),
              child: const Text('Yes, Cancel'),
              onPressed: () {
                // استدعاء دالة الإلغاء من الـ Cubit
                context.read<OrderCubit>().deleteOrder(order.orderId);

                Navigator.of(dialogContext).pop(); // Close the dialog
                context.pop(
                    true); // Close the details screen and return true to refresh list
              },
            ),
          ],
        );
      },
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case "Pending":
      return ColorsManager.orange;
    case "Accepted":
    case "InProgress":
      return ColorsManager.mainBlue;
    case "Done":
      return ColorsManager.green;
    case "Cancel":
      return ColorsManager.errorRed;
    default:
      return ColorsManager.gray;
  }
}
