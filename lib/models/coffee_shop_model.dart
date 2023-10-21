import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShopModel extends ChangeNotifier {
  // list of coffees
  final List<Coffee> _coffeeList = [
    // cappuccino coffee
    Coffee(
      name: 'Cappuccino',
      price: "1.9 ",
      imagePath: 'assets/images/latte-art.png',
    ),
    // expresso coffee
    Coffee(
      name: 'Expresso',
      price: "1.9 ",
      imagePath: 'assets/images/coffee_expresso.png',
    ),
    // latte coffee
    Coffee(
      name: 'Latte',
      price: "1.9 ",
      imagePath: 'assets/images/coffee-latte.png',
    ),

    // m024t0204_g_coffee_10aug22.jpg
    Coffee(
      name: 'Ice Coffee',
      price: "1.9 ",
      imagePath: 'assets/images/m024t0204_g_coffee_10aug22.jpg',
    ),
  ];

  // get list of coffees

  List<Coffee> get coffeeList => _coffeeList;

  //user cart
  final List<Coffee> _userCart = [];

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item into cart
  addCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item into cart
  removeCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // detail screens
  int _count = 1;
  int get count => _count;

  // increament counter
  void increament() {
    _count++;
    notifyListeners();
  }

  // decreament counter
  void decreament() {
    if (_count > 1) {
      _count--;
    }
    notifyListeners();
  }
}
