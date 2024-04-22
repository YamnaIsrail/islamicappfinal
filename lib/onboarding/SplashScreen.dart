import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../global/colors.dart';
import 'SplashScreen2.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
          Container(
            color: Color(0xff23190d),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(

                    )
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 300,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/png/rail.png',
                    //  fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
      
          ),

          Column(
              children: [
                SizedBox(height: 25,),
                Text(
                  'Happy Ramadan Kareem',
                  style: TextStyle(
                    fontFamily: 'Uthman',
                    fontSize: 45,
                    color: primaryColor2,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
      
      
          ],
        ),
      
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder)=>SplashScreen2()));
            },
          splashColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(Icons.arrow_forward),
      ),
      ),
    );
  }
}

