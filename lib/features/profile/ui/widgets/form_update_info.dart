import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/regex/app_regex.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';
import 'package:sanda/features/profile/ui/widgets/user_info_widget.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FormUpdateInfo extends StatelessWidget {
  final bool isEditing;

  const FormUpdateInfo({
    super.key,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    // الوصول إلى الـ Cubit مرة واحدة لتجنب التكرار
    final cubit = context.read<UserDataCubit>();

    return Form(
      // استخدام المفتاح من الـ Cubit
      key: cubit.formKey,
      child: Column(
        children: [
          ProfileInfoField(
            labelText: "Full Name",
            // استخدام الـ controller من الـ Cubit
            controller: cubit.firstNameController,
            isEditing: isEditing,
            icon: LucideIcons.user,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your full name";
              }
              return null;
            },
          ),
          verticalSpace(20),
          ProfileInfoField(
            labelText: "Email",
            controller: cubit.emailController,
            isEditing: isEditing,
            icon: LucideIcons.mail,
            validator: (value) {
              if (value != null && !AppRegex.isValidEmail(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          verticalSpace(20),
          ProfileInfoField(
            labelText: "Phone Number",
            controller: cubit.phoneController,
            isEditing: isEditing,
            icon: LucideIcons.phone,
            validator: (value) {
              if (value != null && !AppRegex.validPhoneNumber(value)) {
                return "Please enter a valid phone number";
              }
              return null;
            },
          ),
          verticalSpace(20),
          ProfileInfoField(
            labelText: "Address",
            controller: cubit.addressController,
            isEditing: isEditing,
            icon: LucideIcons.home,
          ),
        ],
      ),
    );
  }
}