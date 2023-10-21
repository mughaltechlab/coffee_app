import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),

          Text(
            'COFFEE TIME',
            style: GoogleFonts.aclonica(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
              color: Colors.brown.shade600,
            ),
          ),

          // image
          FadeInLeftBig(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(colors: [
                  Colors.brown.shade100,
                  Colors.brown.shade200,
                  Colors.brown.shade300,
                  Colors.brown.shade100,
                ]),
                image: const DecorationImage(
                  image: AssetImage('assets/images/coffee.png'),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // info

          Text(
            'Developed By',
            style: GoogleFonts.aclonica(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
              color: Colors.brown.shade600,
            ),
          ),
          BounceInRight(
            delay: const Duration(milliseconds: 700),
            child: Text(
              'SAQIB AHMED',
              style: GoogleFonts.aclonica(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
                color: Colors.brown.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
