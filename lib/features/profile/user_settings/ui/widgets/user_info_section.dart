import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import '../../view_model/user_setting_view_model.dart';

class UserInfoSection extends StatelessWidget {
  final UserSettingViewModel viewModel;

  const UserInfoSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(viewModel.imagePath),
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(viewModel.userName, style: TextStyles.font16DarkGrayBold),
            verticalSpace(4),
            Text(
              viewModel.email,
              style: TextStyles.font14GrayRegular
            ),
          ],
        ),
      ],
    );
  }
}
