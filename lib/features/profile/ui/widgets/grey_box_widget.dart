import 'package:flutter/material.dart';

class GreyBoxWidget extends StatelessWidget {
  final String label;

  const GreyBoxWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3), // Grey box color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xffB3B3B3),
          fontSize: 16,
        ),
      ),
    );
  }
}
