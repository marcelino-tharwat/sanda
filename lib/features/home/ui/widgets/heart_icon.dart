import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isLiked = false; // Track whether the heart is "liked" or not

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4.h,
      right: 4.w,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isLiked = !isLiked; // Toggle the liked state on press
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300), // Transition duration
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // Set the transition time here
              child: Icon(
                key: ValueKey<bool>(isLiked), // Ensure the widget changes when `isLiked` changes
                isLiked ? Icons.favorite : Icons.favorite_border, // Filled when liked, outlined otherwise
                color: isLiked ? Colors.red : const Color(0xff3A7CA5), // Red when liked, else default color
                size: 23.sp, // Adjust size using ScreenUtil
              ),
            ),
          ),
        ),
      ),
    );
  }
}