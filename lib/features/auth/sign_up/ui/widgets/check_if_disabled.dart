import 'package:flutter/material.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class CheckIfDisabled extends StatelessWidget {
  final ValueNotifier<bool> isDisabledNotifier;

  const CheckIfDisabled({super.key, required this.isDisabledNotifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isDisabledNotifier,
          builder: (context, isDisabledValue, child) {
            return Checkbox(
              value: isDisabledValue,
              activeColor: ColorsManager.mainBlue,
              onChanged: (newValue) {
                isDisabledNotifier.value = newValue!;
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
