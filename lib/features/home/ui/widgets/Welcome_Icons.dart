import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';

class WelcomeIcons extends StatelessWidget {
  const WelcomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserDataSuccess) {
          final userData = state.userResponse;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome ${userData.firstName}👋🏻',
                  style: TextStyles.font12DarkGraySemiBold
                      .copyWith(color: ColorsManager.wight,fontSize: 16.sp)),
              // Profile Picture Icon
              CircleAvatar(
                radius: 18,
                backgroundImage:
                    MemoryImage(base64Decode(userData.profilePicturePath!)),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome 👋🏻',
                  style: TextStyles.font24DarkGrayBold
                      .copyWith(color: ColorsManager.wight)),
              // Profile Picture Icon
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                    'assets/icons/profile-pic.jpg'), // Path to profile image
              ),
            ],
          );
        }
      },
    );
  }
}
