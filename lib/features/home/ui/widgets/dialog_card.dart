import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/core/widgets/app_text_button.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(children: [
          verticalSpace(20),
          const AppFormTextFiled(hintText: "Phone Number"),
          verticalSpace(20),
          const AppFormTextFiled(hintText: "Location OR Address"),
          verticalSpace(20),
          const AppFormTextFiled(hintText: "Comment"),
          // const Spacer(),
          verticalSpace(30),
          AppTextButton(
              bottonText: 'Order now',
              onPressed: () {
                Navigator.pop(context);
              }),
          verticalSpace(20),
        ]),
      ),
    );
  }
}
