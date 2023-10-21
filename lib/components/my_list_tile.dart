import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final IconData iconData;
  const MyListTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          // coffee image
          leading: Card(
            color: Colors.grey.shade200,
            child: Image.asset(
              coffee.imagePath.toString(),
            ),
          ),

          // coffee name
          title: Text(
            coffee.name.toString(),
          ),

          // coffee price
          subtitle: Text(
            coffee.price.toString(),
          ),

          // button
          trailing: IconButton(onPressed: onPressed, icon: Icon(iconData)),
        ),
      ),
    );
  }
}
