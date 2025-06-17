import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/features/cart/logic/cart_cubit.dart';
import 'package:sanda/features/cart/ui/cart_screen.dart';
import 'package:sanda/features/favorite/logic/fav_cubit.dart';
import 'package:sanda/features/favorite/ui/favorite_screen.dart';
import 'package:sanda/features/home/logic/category/category_cubit.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/home/ui/home_screen.dart';
import 'package:sanda/features/order/ui/req_order.dart';
import 'package:sanda/features/profile/user_settings/ui/user_setting_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(currentIndex),
      bottomNavigationBar: NavigationBar(
        elevation: 0,

        surfaceTintColor: ColorsManager.mainBlue,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // animationDuration: const Duration(milliseconds: 200),

        height: 60.h,

        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Icon(
              currentIndex == 0 ? Icons.home : Icons.home_outlined,
              color: currentIndex == 0
                  ? const Color(0xff3A7CA5)
                  : ColorsManager.mainBlue,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              currentIndex == 1 ? Icons.article : Icons.article_outlined,
              color: currentIndex == 1
                  ? const Color(0xff3A7CA5)
                  : ColorsManager.mainBlue,
            ),
            label: "Orders",
          ),
          NavigationDestination(
            icon: Icon(
              currentIndex == 2
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: currentIndex == 2
                  ? const Color(0xff3A7CA5)
                  : ColorsManager.mainBlue,
            ),
            label: "Favorite",
          ),
          NavigationDestination(
            icon: Icon(
              currentIndex == 3 ? Icons.person : Icons.person_outline,
              color: currentIndex == 3
                  ? const Color(0xff3A7CA5)
                  : ColorsManager.mainBlue,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => getIt<CategoryCubit>()
            ..getServiceByCategory(categoryName: "Home Assistance"),
          child: const HomeScreen(),
        );
      case 1:
        return BlocProvider(
          create: (context) => getIt<OrderCubit>()..getAllUserOrder(userId),
          child: const AllUserOdersScreen(),
        );
      case 2:
        return Center(
          child: BlocProvider(
            create: (context) =>
                getIt<FavCubit>(),
            child: const FavoriteScreen(),
          ),
        );
      case 3:
        return const UserSettingScreen();
      default:
        return const Center(child: Text("Home"));
    }
  }
}
