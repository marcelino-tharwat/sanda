import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingListItem extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final double iconSize;
  final String title;
  final VoidCallback onTap;

  const SettingListItem({
    super.key,
    this.iconPath,
    this.iconData,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 24,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;

    if (iconPath != null) {
      iconWidget = Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Image.asset(
            iconPath!,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
        ),
      );
    } else if (iconData != null) {
      iconWidget = Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(
            iconData,
            size: iconSize,
            color: iconColor ?? Colors.black,
          ),
        ),
      );
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 16),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
