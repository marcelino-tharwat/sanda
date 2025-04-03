import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';

class UserInfoWidget extends StatelessWidget {
  final UserResponse userResponseModel;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final String labelText;
  const UserInfoWidget(
      {super.key,
      required this.userResponseModel,
      required this.labelText,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: TextFormField(
              controller: controller, // ربط الـ controller
              decoration: InputDecoration(
                labelText: labelText,
                // border: const OutlineInputBorder(),
              ),
              validator: validator,
            ),

          ),
          // Position the icon at the far right of the screen
          Positioned(
            right: 10, // Add a small offset from the right edge
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  // Handle edit action
                },
                icon: const Icon(LucideIcons.edit2),
                color: ColorsManager.mainBlue,
                iconSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
