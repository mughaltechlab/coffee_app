// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    double rad = 100;
    return Container(
      margin: const EdgeInsets.all(25).copyWith(top: 5),
      decoration: BoxDecoration(
        // color: Colors.brown,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(rad),
          topRight: Radius.circular(rad),
        ),
      ),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade300,
        tabActiveBorder: Border.all(color: Colors.amber),
        tabBorderRadius: 15,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          // Home button
          GButton(
            icon: Icons.home,
            text: 'HOME',
          ),

          // cart button
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'CART',
          ),
        ],
      ),
    );
  }
}
