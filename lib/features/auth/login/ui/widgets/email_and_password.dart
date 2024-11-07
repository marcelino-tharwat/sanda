import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/regex/app_regex.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscured = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasnumber = false;
  bool hasMinLen = false;
  bool hasSpechailCharacter = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordValidationListener();
  }

  void setupPasswordValidationListener() {
    passwordController.addListener(
      () {
        setState(() {
          hasLowerCase = AppRegex.hasLowercase(passwordController.text);
          hasUpperCase = AppRegex.hasUppercase(passwordController.text);
          hasSpechailCharacter =
              AppRegex.hasSpecialCharacter(passwordController.text);
          hasMinLen = AppRegex.hasMinLength(passwordController.text);
          hasnumber = AppRegex.hasNumber(passwordController.text);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppFormTextFiled(
              controller: context.read<LoginCubit>().emailController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isValidEmail(value)) {
                  return 'please enter a valid email';
                }
              },
              hintText: 'Email Or Phone Number '),
          verticalSpace(18),
          AppFormTextFiled(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              } else if (!hasLowerCase) {
                return 'please enter At leat 1 lowercase letter';
              } else if (!hasUpperCase) {
                return 'please enter At leat 1 Uppercase letter';
              } else if (!hasSpechailCharacter) {
                return 'please enter At leat 1 Specail Character letter';
              } else if (!hasnumber) {
                return 'please enter At leat 1 Number letter';
              } else if (!hasMinLen) {
                return 'please enter At leat 8 character long';
              }
            },
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
                  : const Icon(Icons.visibility),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }
}
