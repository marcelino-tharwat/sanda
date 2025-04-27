import 'package:flutter/material.dart';
import 'package:sanda/core/widgets/app_form_text_filed.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/add_card_button.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/add_card_title.dart';
import 'package:sanda/features/paymnet/ui/widget/dialog_widgets/default_payment_checkbox.dart';

class AddNewCardForm extends StatelessWidget {
  final bool isDefaultPaymentMethod;
  final ValueChanged<bool?> onDefaultPaymentChanged;

  const AddNewCardForm({
    super.key,
    required this.isDefaultPaymentMethod,
    required this.onDefaultPaymentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddCardTitle(),
        const SizedBox(height: 20),
        const AppFormTextFiled(hintText: 'Name on card'),
        const SizedBox(height: 12),
        const AppFormTextFiled(
          hintText: 'Card number',
        ),
        const SizedBox(height: 12),
        const AppFormTextFiled(
          hintText: 'Expire Date',
        ),
        const SizedBox(height: 12),
        const AppFormTextFiled(
          hintText: 'CVV',
        ),
        const SizedBox(height: 20),
        DefaultPaymentCheckbox(
          value: isDefaultPaymentMethod,
          onChanged: onDefaultPaymentChanged,
        ),
        const SizedBox(height: 20),
        AddCardButton(onPressed: () {}),
      ],
    );
  }
}
