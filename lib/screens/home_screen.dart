import 'package:coffee_app/components/bottom_bar.dart';
import 'package:coffee_app/constants.dart';
import 'package:coffee_app/screens/cart_screen.dart';
import 'package:coffee_app/screens/coffee_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --------------- functions -----------------

  int selectIndex = 0;

  navigateBottomNavBar(index) {
    setState(() {
      selectIndex = index;
    });
  }

  // screens list
  List<Widget> screensList = [
    // coffee screen
    const CoffeeScreen(),

    // cart screen
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      // bottom nav bar
      bottomNavigationBar: BottomBar(
        onTabChange: (index) => navigateBottomNavBar(index),
      ),

      body: screensList[selectIndex],
    );
  }
}
