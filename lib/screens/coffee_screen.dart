import 'package:coffee_app/components/my_image_slider.dart';
import 'package:coffee_app/components/my_list_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop_model.dart';
import 'package:coffee_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  void addFunction(Coffee coffee) {
    Provider.of<CoffeeShopModel>(context, listen: false).addCart(coffee);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.brown.shade200,
        content: const Text(
          'Added To Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopModel>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Tag
              const Text(
                'Choose Your Desired Coffee',
                // 'CHOOSE YOUR DESIRED COFFEE',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'cursive',
                  fontWeight: FontWeight.w800,
                  wordSpacing: 4.0,
                ),
                // style: GoogleFonts.archivo(
                //   fontSize: 20,
                // ),
              ),

              const SizedBox(height: 10),

              // hero_image or slider

              Stack(
                children: [
                  Container(
                    height: 250,
                    // width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.brown.shade400,
                    ),
                  ),
                  const MyImageSlider(),
                ],
              ),

              const SizedBox(height: 10),

              //coffee List
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // get each coffee
                    final coffees = value.coffeeList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                coffeeName: coffees.name.toString(),
                                coffeeImg: coffees.imagePath.toString(),
                                coffeePrice: coffees.price.toString(),
                              ),
                            ));
                      },
                      child: MyListTile(
                        coffee: coffees,
                        iconData: Icons.add,
                        onPressed: () {
                          addFunction(coffees);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
