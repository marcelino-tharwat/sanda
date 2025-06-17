import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';
import 'package:sanda/features/order/ui/order_item.dart';

// 1. تم تحويلها إلى StatelessWidget
class AllUserOdersScreen extends StatelessWidget {
  const AllUserOdersScreen({super.key});

  // دالة لجلب الطلبات يمكن استدعاؤها من أي مكان يملك context
  Future<void> _fetchUserOrders(BuildContext context) async {
    context.read<OrderCubit>().getAllUserOrder(userId);
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<OrderCubit>().state is OrderInitial) {
      _fetchUserOrders(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Orders',
          style: TextStyles.font24mainBlueBold,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _fetchUserOrders(context), // 3. تحديث عند السحب
          color: ColorsManager.mainBlue,
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is OrderLoading || state is OrderInitial) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                );
              } else if (state is OrderFailure) {
                return _buildErrorState(context, state.errMessage);
              } else if (state is ListUserOrderSuccess) {
                final orders = state.orders;
                if (orders.isEmpty) {
                  return _buildEmptyState(context);
                }
                return _buildOrdersList(context, orders);
              } else {
                return _buildEmptyState(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList(
      BuildContext context, List<UserOrderResModel> orders) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return GestureDetector(
          onTap: () async {
            final result = await GoRouter.of(context).push<bool>(
              Routes.orderDetailesScreen,
              extra: order,
            );
            if (result == true) {
              _fetchUserOrders(context);
            }
          },
          child: OrderItem(order: order),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 80.sp, color: Colors.grey[400]),
            verticalSpace(20),
            Text(
              'You Have No Orders',
              style: TextStyles.font24DarkGrayBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              'When you accept an order, it will appear here.',
              style: TextStyles.font14DarkGrayBold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String errorMessage) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 80.sp,
              color: Colors.redAccent,
            ),
            verticalSpace(20),
            Text(
              'Failed to Load Your Orders',
              style: TextStyles.font24DarkGrayBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              'We couldn\'t connect to our servers. Please check your connection and try again.',
              style: TextStyles.font14DarkGrayBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(30),
            ElevatedButton.icon(
              onPressed: () =>
                  _fetchUserOrders(context), // 5. تحديث عند الضغط على الزر
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
