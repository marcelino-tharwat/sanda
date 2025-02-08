import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/routing/app_router.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';

class DropDownGender extends StatefulWidget {
  const DropDownGender({super.key});

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.wightGray,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text("Gender", style: TextStyles.font14GrayRegular),
      value: selectedGender,
      items: const [
        DropdownMenuItem(value: "Male", child: Text("Male")),
        DropdownMenuItem(value: "Female", child: Text("Female")),
      ],
      onChanged: (String? value) {
        setState(() {
          selectedGender = value;
          if (value != null) {
            context.read<SignUpCubit>().selectedGender = value;
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a gender';
        }
        return null;
      },
    );
  }
}
