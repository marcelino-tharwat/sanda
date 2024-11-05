import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_text_button.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          bottonText: 'Donor',
          onPressed: () {
            context.go('');
          },
        ),
        verticalSpace(16),
        AppTextButton(
          bottonText: 'Vlounteer',
          onPressed: () {
            context.go('');
          },
        ),
        verticalSpace(16),
        AppTextButton(
          bottonText: 'Disable person',
          onPressed: () {
            context.go('');
          },
        ),
        verticalSpace(16),
        AppTextButton(
          bottonText: 'Elder person',
          onPressed: () {
            context.go('');
          },
        )
      ],
    );
  }
}
