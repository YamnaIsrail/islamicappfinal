import 'package:flutter/material.dart';
import 'package:islamicappfinal/features/Hadith/hadith_screen.dart';
import 'package:islamicappfinal/global/colors.dart';
import 'package:islamicappfinal/main_screen/home_screen.dart';

import '../design_elements/stars_painter.dart';
// import '../features/hijri_calender/src/hijri_calender_builder.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // Centered image container with adjusted top margin
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 270,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash/alnoor.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'The Light',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Jameel',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Al NOOR',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Jameel',
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF57170),
                  ),
                ),
                const SizedBox(height: 15),
                IconButton.outlined(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => HomeScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  style: ButtonStyle(
                    iconSize: MaterialStateProperty.all(40.0),
                    iconColor: MaterialStateProperty.all(primaryColor2),
                  ),
                ),

              ],
            ),
          ),
          // Sprinkle stars
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: StarsPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

