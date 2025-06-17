import 'package:flutter/material.dart';
import 'package:sanda/core/theming/styles.dart';

class AddCardTitle extends StatelessWidget {
  const AddCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add new card',
        style: TextStyles.font20mainBlueBold,
      ),
    );
  }
}