import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/favorite/logic/fav_cubit.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
// ... (باقي الـ imports)

class HeartIcon extends StatelessWidget {
  final dynamic service;

  const HeartIcon(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    // ID الخدمة الأصلي (من ProductOrServiceModel أو FavListResModel)
    final int serviceId = service.id; 

    return BlocBuilder<FavCubit, List<FavListResModel>>(
      // --- هنا التصحيح الحاسم ---
      buildWhen: (previousState, currentState) {
        // ابحث باستخدام 'serviceId' في كلا الحالتين
        final wasLiked = previousState.any((s) => s.serviceId == serviceId);
        final isNowLiked = currentState.any((s) => s.serviceId == serviceId);
        // أعد البناء فقط إذا تغيرت حالة الإعجاب
        return wasLiked != isNowLiked;
      },
      builder: (context, favList) {
        // استخدم نفس المنطق الصحيح هنا
        final bool isLiked = favList.any((favItem) => favItem.serviceId == serviceId);
        
        // يمكنك إضافة print هنا للتأكد أثناء الاختبار
        // print("Service ID: $serviceId | Is Liked: $isLiked");

        return GestureDetector(
          onTap: () {
            late FavListResModel favItem;

            if (service is ProductOrServiceModel) {
              favItem = FavListResModel(
                // يمكنك استخدام serviceId كـ id مؤقتاً إذا لم يكن هناك استخدام آخر له
                id: service.id, 
                serviceId: service.id, 
                serviceName: service.name,
                serviceImage: service.image,
                serviceCategory: service.category,
                servicePrice: service.price,
                addedDate: DateTime.now(),
              );
            } else if (service is FavListResModel) {
              favItem = service;
            } else {
              // هذا السطر جيد للحماية من الأخطاء المستقبلية
              throw Exception("Unsupported type passed to HeartIcon: ${service.runtimeType}");
            }
            context.read<FavCubit>().toggleFavoriteStatus(favItem);
          },
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? ColorsManager.mainBlue : const Color(0xff3A7CA5),
            size: 23.sp,
          ),
        );
      },
    );
  }
}