// ignore_for_file: avoid_unnecessary_containers

import 'package:animate_do/animate_do.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String coffeeName;
  final String coffeeImg;
  final String coffeePrice;
  const DetailScreen({
    super.key,
    required this.coffeeName,
    required this.coffeeImg,
    required this.coffeePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopModel>(builder: (context, value, child) {
      double totalPrice = double.parse(coffeePrice) * value.count;
      return Scaffold(
        backgroundColor: Colors.brown[50],
        body: Column(
          children: [
            const SizedBox(height: 150),
            // coffee name
            BounceInDown(
              child: Text(
                coffeeName.toUpperCase(),
                style: GoogleFonts.aclonica(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                  color: Colors.brown.shade600,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // coffee image
            FadeInLeftBig(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    // color: Colors.brown.shade200,
                    gradient: LinearGradient(colors: [
                      Colors.brown.shade100,
                      Colors.brown.shade200,
                      Colors.brown.shade300,
                      Colors.brown.shade400,
                    ]),
                    image: DecorationImage(
                      image: AssetImage(
                        coffeeImg,
                      ),
                    )),
              ),
            ),

            const SizedBox(height: 5),

            // price
            BounceInDown(
              delay: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price: ',
                    style: GoogleFonts.aclonica(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                      color: Colors.brown.shade600,
                    ),
                  ),
                  Text(
                    coffeePrice,
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                      color: Colors.brown.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // more info
            BounceInDown(
              delay: const Duration(milliseconds: 700),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.brown.shade100,
                    Colors.brown.shade200,
                    Colors.brown.shade300,
                  ]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // quantity buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade600,
                          ),
                        ),

                        // buttons

                        Container(
                          child: Row(
                            children: [
                              // increment
                              TextButton(
                                onPressed: () {
                                  context.read<CoffeeShopModel>().increament();
                                },
                                child: const Icon(
                                  Icons.plus_one,
                                  color: Colors.brown,
                                ),
                              ),
                              // value
                              Text(value.count.toString()),
                              // decreament
                              TextButton(
                                onPressed: () {
                                  context.read<CoffeeShopModel>().decreament();
                                },
                                child: const Icon(
                                  Icons.exposure_minus_1_outlined,
                                  color: Colors.brown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade600,
                          ),
                        ),
                        Text(
                          totalPrice.abs().toStringAsFixed(2),
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // cart button
            BounceInUp(
              delay: const Duration(milliseconds: 700),
              child: GestureDetector(
                onTap: () {
                  Provider.of<CoffeeShopModel>(context, listen: false).addCart(
                      Coffee(
                          name: coffeeName,
                          price: totalPrice.toStringAsFixed(3),
                          imagePath: coffeeImg));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.brown.shade700,
                      content: const Text(
                        'Added To Cart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.brown.shade100,
                      Colors.brown.shade200,
                      Colors.brown.shade300,
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "ADD TO CART",
                      style: GoogleFonts.aclonica(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                        color: Colors.brown.shade600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
