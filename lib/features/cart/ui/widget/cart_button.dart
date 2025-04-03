import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class CartButtons extends StatefulWidget {
  const CartButtons({
    super.key,
  });

  @override
  State<CartButtons> createState() => _CartButtonsState();
}

class _CartButtonsState extends State<CartButtons> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.trash),
          color: ColorsManager.mainBlue,
        ),
        verticalSpace(10),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (count > 0) {
                    count--;
                  }
                });
              },
              icon: const Icon(CupertinoIcons.minus_circled),
              color: ColorsManager.mainBlue,
            ),
            horizontalSpace(6),
            Text(
              count.toString(),
              style: TextStyles.font12mainBlueRegular,
            ),
            horizontalSpace(6),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: const Icon(
                CupertinoIcons.plus_circled,
              ),
              color: ColorsManager.mainBlue,
            ),
          ],
        ),
      ],
    );
  }
}
