import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/profile/user_settings/ui/widgets/setting_list_items_column.dart';
import 'package:sanda/features/profile/user_settings/ui/widgets/user_info_section.dart';
import '../view_model/user_setting_view_model.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = UserSettingViewModel();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My profile', style: TextStyles.font30MainBlueBold),
              verticalSpace(20),
              UserInfoSection(viewModel: viewModel),
              verticalSpace(30),
              const Expanded(child: SettingListItemsColumn()),
            ],
          ),
        ),
      ),
    );
  }
}
