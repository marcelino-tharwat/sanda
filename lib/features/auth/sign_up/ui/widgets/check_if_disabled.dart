import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';

class CheckIfDisabled extends StatelessWidget {

  const CheckIfDisabled({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: context.read<SignUpCubit>().isDisabledNotifier,
          builder: (context, isDisabledValue, child) {
            return Checkbox(
              value: isDisabledValue,
              activeColor: ColorsManager.mainBlue,
              onChanged: (newValue) {
                context.read<SignUpCubit>().isDisabledNotifier.value = newValue!;
              },
            );
          },
        ),
        Text(
          "Do you have any mobility disability?",
          style: TextStyles.font12darkGrayRegular,
        ),
      ],
    );
  }
}
