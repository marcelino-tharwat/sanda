import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultPaymentCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const DefaultPaymentCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _DefaultPaymentCheckboxState createState() => _DefaultPaymentCheckboxState();
}

class _DefaultPaymentCheckboxState extends State<DefaultPaymentCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: const Color(0xFF488E60),
        ),
        Expanded(
          child: Text(
            'Set as default payment method',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}