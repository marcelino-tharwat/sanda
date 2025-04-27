import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/regex/app_regex.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';
import 'package:sanda/features/profile/logic/cubit/profile_cubit/profile_data_cubit.dart';
import 'package:sanda/features/profile/ui/widgets/user_info_widget.dart';

class FormUpdateInfo extends StatelessWidget {
  final UserResponse userResponseModel;
  const FormUpdateInfo({super.key, required this.userResponseModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileDataCubit>().formKey,
      child: Column(
        children: [
          UserInfoWidget(
            labelText: "Full Name",
            controller: context.read<ProfileDataCubit>().firstNameControlr,
            userResponseModel: userResponseModel,
          ),
          verticalSpace(20),
          UserInfoWidget(
            labelText: "Email",
            controller: context.read<ProfileDataCubit>().emialControlr,
            validator: (value) {
              if (value != null || value!.isEmpty) {
                if (!AppRegex.isValidEmail(value!)) {
                  return "please enter a valid email";
                }
              }
            },
            userResponseModel: userResponseModel,
          ),
          verticalSpace(20),
          UserInfoWidget(
            labelText: "Phone Number",
            controller: context.read<ProfileDataCubit>().phoneControlr,
            validator: (value) {
              if (value != null || value!.isEmpty) {
                if (!AppRegex.validPhoneNumber(value!)) {
                  return "please enter a valid phone number";
                }
              }
            },
            userResponseModel: userResponseModel,
          ),
          verticalSpace(20),
          UserInfoWidget(
            labelText: "Address",
            controller: context.read<ProfileDataCubit>().addressControler,
            userResponseModel: userResponseModel,
          ),
          verticalSpace(50),
          AppTextButton(
            bottonText: "Edit",
            onPressed: () {
              bool isValid = context
                  .read<ProfileDataCubit>()
                  .formKey
                  .currentState!
                  .validate();
              if (!isValid) {
                return;
              } else {
                context.read<ProfileDataCubit>().updateProfileData();
              }
            },
          ),
        ],
      ),
    );
  }
}