import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({super.key});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // image 1
        Roulette(
          spins: 1,
          infinite: true,
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            child: Image.asset(
              'assets/images/coffee (3).png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // // image 2
        // Container(
        //   width: 160,
        //   child: Image.asset('assets/images/coffee (2).png'),
        // ),

        // image 3..
      ],
    );
  }
}
