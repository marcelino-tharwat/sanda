import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardTitle extends StatelessWidget {
  const AddCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add new card',
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}