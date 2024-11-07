import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppFormTextFiled(hintText: 'Email Or Phone Number '),
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
        )
      ],
    );
  }
}
