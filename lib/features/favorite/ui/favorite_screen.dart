import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/favorite/logic/fav_cubit.dart';
import 'package:sanda/features/favorite/ui/widget/fav_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<FavCubit>().loadFavorites();

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
      body: RefreshIndicator(
        onRefresh: () async {
          // عند السحب للتحديث، نطلب من الـ Cubit إعادة تحميل البيانات
          context.read<FavCubit>().loadFavorites();
        },
        child: BlocBuilder<FavCubit, List<FavListResModel>>(
          builder: (context, favList) {
            return favList.isEmpty
                ? _buildEmptyState(context)
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: FavGrid(
                      favList: favList,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

Widget _buildEmptyState(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 80.sp, color: Colors.grey[400]),
          verticalSpace(20),
          Text(
            'You Have No favorites',
            style: TextStyles.font24DarkGrayBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          Text(
            'When you added it, it will appear here.',
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
            errorMessage,
            // 'We couldn\'t connect to our servers. Please check your connection and try again.',
            style: TextStyles.font14DarkGrayBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(30),
          ElevatedButton.icon(
            onPressed: () {},
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
