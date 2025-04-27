import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCardButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A7CA5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.zero,
        fixedSize: const Size(400, 55),
      ),
      child: Text(
        'ADD CARD',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}