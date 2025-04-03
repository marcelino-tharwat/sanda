import 'package:flutter/material.dart';

class WelcomeIcons extends StatelessWidget {
  const WelcomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      // mainAxisAlignment: MainAxisAlignment.end, // Align icons to the right
      children: [
        // Shopping Cart Icon
        // ColorFiltered(
        //   colorFilter: ColorFilter.mode(
        //     Color(0xff3A7CA5),
        //     BlendMode.srcIn,
        //   ),
        //   child: IconButton(
        //     icon: Image.asset(
        //       'assets/icons/shopping_cart.png', // Path to shopping cart icon
        //       width: 24.w,
        //       height: 24.h,
        //     ),
        //     onPressed: () {}, // Define the action here
        //   ),
        // ),

        // Profile Picture Icon
        CircleAvatar(
          radius: 16,
          backgroundImage: const AssetImage(
              'assets/icons/profile-pic.jpg'), // Path to profile image
        ),
      ],
    );
  }
}
