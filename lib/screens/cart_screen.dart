import 'package:coffee_app/components/my_list_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // function for removing cart items from userCart list
  void removeCartItem(Coffee coffee) {
    Provider.of<CoffeeShopModel>(context, listen: false).removeCart(coffee);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown[800],
        content: Text(
          'remove ${coffee.name}',
          style: GoogleFonts.zenDots(
            fontSize: 20,
            color: Colors.brown,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'cancel',
              style: GoogleFonts.zenDots(
                fontSize: 20,
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopModel>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            // title
            Text(
              'Cart Screen',
              style: GoogleFonts.zenDots(
                fontSize: 20,
                color: Colors.brown,
              ),
            ),

            // cart list
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (BuildContext context, int index) {
                  // get each cart coffee items
                  final coffeeCartList = value.userCart[index];
                  return MyListTile(
                    coffee: coffeeCartList,
                    onPressed: () {
                      removeCartItem(coffeeCartList);
                    },
                    iconData: Icons.delete,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
