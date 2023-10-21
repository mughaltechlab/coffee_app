import 'package:coffee_app/intro_screens/page_1.dart';
import 'package:coffee_app/intro_screens/page_2.dart';
import 'package:coffee_app/intro_screens/page_3.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // pageview
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          // smooth page indicator

          Container(
            alignment: const Alignment(0, 0.78),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                onLastPage
                    ? const Text('    ')
                    : GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text(
                          'skip',
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade600,
                          ),
                        ),
                      ),

                // dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 12,
                    verticalOffset: 15,
                    jumpScale: 2.0,
                    dotColor: Colors.brown.shade200,
                    activeDotColor: Colors.brown.shade500,
                  ),
                ),

                // next
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        child: Text(
                          'done',
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade800,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInCirc);
                        },
                        child: Text(
                          'next',
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.brown.shade600,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
