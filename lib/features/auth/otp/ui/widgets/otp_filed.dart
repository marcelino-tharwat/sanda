import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanda/core/theming/colors.dart';

class OtpFiled extends StatelessWidget {
  const OtpFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
                height: 64,
                width: 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: "0",
                      hintStyle: TextStyle(color: ColorsManager.gray),
                      border: authOutlineInputBorder,
                      enabledBorder: authOutlineInputBorder,
                      focusedBorder: authOutlineInputBorder),
                ),
              );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: ColorsManager.wightGray, width: 1.3),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
