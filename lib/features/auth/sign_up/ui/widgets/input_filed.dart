import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/regex/app_regex.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/auth/sign_up/ui/widgets/drop_down_gender.dart';

class InputFiled extends StatefulWidget {
  const InputFiled({super.key});

  @override
  State<InputFiled> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputFiled> {
  late TextEditingController passordControlr;
  late TextEditingController passordConformationControlr;
  late TextEditingController egyptianNationalIDController;
  late TextEditingController phonControlr;
  bool isObscured = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasnumber = false;
  bool hasMinLen = false;
  bool validPhoneNumber = false;
  bool validEgyptianNationalID = false;
  bool hasSpechailCharacter = false;
  @override
  void initState() {
    super.initState();
    passordControlr = context.read<SignUpCubit>().passwordControlr;
    phonControlr = context.read<SignUpCubit>().phoneControlr;
    egyptianNationalIDController =
        context.read<SignUpCubit>().egyptianNationalIDController;
    setupPasswordControlorListener();
  }

  void setupPasswordControlorListener() {
    passordControlr.addListener(
      () {
        setState(() {
          hasLowerCase = AppRegex.hasLowercase(passordControlr.text);
          hasMinLen = AppRegex.hasMinLength(passordControlr.text);
          hasSpechailCharacter =
              AppRegex.hasSpecialCharacter(passordControlr.text);
          hasUpperCase = AppRegex.hasUppercase(passordControlr.text);
          hasnumber = AppRegex.hasNumber(passordControlr.text);
          validPhoneNumber = AppRegex.validPhoneNumber(phonControlr.text);
          validEgyptianNationalID =
              AppRegex.egyptianNationalID(egyptianNationalIDController.text);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppFormTextFiled(
            hintText: 'First Name',
            controller: context.read<SignUpCubit>().firstNameControlr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a First Name';
              }
            },
          ),
          verticalSpace(18),
          AppFormTextFiled(
            hintText: 'Last Name',
            controller: context.read<SignUpCubit>().lastNameControlr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a Last Name';
              }
            },
          ),
          verticalSpace(18),
          AppFormTextFiled(
            hintText: 'Phone Number',
            controller: context.read<SignUpCubit>().phoneControlr,
            validator: (value) {
              if (value == null || value.isEmpty || !validPhoneNumber) {
                return 'please enter a valid phone';
              }
            },
            keyboardType: TextInputType.number,
          ),
          verticalSpace(18),
          AppFormTextFiled(
            hintText: 'National ID',
            controller:
                context.read<SignUpCubit>().egyptianNationalIDController,
            validator: (value) {
              if (value == null || value.isEmpty || !validEgyptianNationalID) {
                return 'please enter a valid ID';
              }
            },
            keyboardType: TextInputType.number,
          ),
          verticalSpace(18),
          AppFormTextFiled(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emialControlr,
          ),
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
            controller: context.read<SignUpCubit>().passwordControlr,
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
            controller:
                context.read<SignUpCubit>().passwordConfirmationControlr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              } else if (value != passordControlr.text) {
                return 'Passwords do not match';
              }
            },
          ),
          verticalSpace(18),
          Row(
            children: [
              Expanded(
                child: AppFormTextFiled(
                  hintText: 'Age',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter an age';
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              horizontalSpace(16), // Add some spacing between the fields
              const Expanded(
                child: DropDownGender(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
