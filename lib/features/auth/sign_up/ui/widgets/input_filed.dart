import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/features/auth/sign_up/ui/widgets/drop_down_gender.dart';

class InputFiled extends StatefulWidget {
  const InputFiled({super.key});

  @override
  State<InputFiled> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputFiled> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppFormTextFiled(hintText: 'First Name'),
        verticalSpace(18),
        const AppFormTextFiled(hintText: 'Last Name'),
        verticalSpace(18),
        const AppFormTextFiled(hintText: 'Phone Number'),
        verticalSpace(18),
        const AppFormTextFiled(hintText: 'National ID'),
        verticalSpace(18),
        const AppFormTextFiled(hintText: 'Email'),
        verticalSpace(18),
        AppFormTextFiled(
          hintText: 'Password',
          isObscured: isObscured,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: isObscured
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
        ),
        verticalSpace(18),
        AppFormTextFiled(
          hintText: 'Confirm Password',
          isObscured: isObscured,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: isObscured
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
        ),
        verticalSpace(18),
        Row(
          children: [
            const Expanded(
              child: AppFormTextFiled(hintText: 'Age'),
            ),
            horizontalSpace(16), // Add some spacing between the fields
            const Expanded(
              child: DropDownGender(),
            ),
          ],
        ),
      ],
    );
  }
}
