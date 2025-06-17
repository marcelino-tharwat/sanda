import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'setting_list_item.dart';

class SettingListItemsColumn extends StatelessWidget {
  const SettingListItemsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => verticalSpace(30),
      itemBuilder: (context, index) {
        final items = [
          SettingListItem(
              iconPath: 'assets/icons/person.png',
              iconColor: const Color(0xFF31338D),
              backgroundColor: const Color(0xFFE1E3F9),
              iconSize: 24,
              title: 'My Profile',
              onTap: () {
                GoRouter.of(context).push(Routes.profileScreen);
              }),
          SettingListItem(
              iconPath: 'assets/icons/location_on.png',
              iconColor: Colors.black,
              backgroundColor: Colors.grey.shade300,
              iconSize: 24,
              title: 'Shipping addresses',
              onTap: () {
                GoRouter.of(context).push(Routes.chooseShippingAddress);
              }),
          SettingListItem(
            iconData: Icons.payment,
            iconColor: const Color(0xFF488E60),
            backgroundColor: const Color(0xFFD2F1DF),
            iconSize: 24,
            title: 'Payment methods',
            onTap: () =>{GoRouter.of(context).push(Routes.paymentMethodScreen)},
          ),
          SettingListItem(
              iconPath: 'assets/icons/language.png',
              iconColor: const Color(0xFFF012A6),
              backgroundColor: const Color(0xFFF9C8E5),
              iconSize: 24,
              title: 'Change Language',
              onTap: () {}),
          SettingListItem(
              iconPath: 'assets/icons/logout.png',
              iconColor: const Color(0xFFEA3437),
              backgroundColor: const Color(0xFFFFE8EE),
              iconSize: 24,
              title: 'Logout',
              onTap: () {}),
        ];
        return items[index];
      },
    );
  }
}
