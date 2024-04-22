import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../Api_data/models/quran_api_model.dart';


class SurahSlider extends StatefulWidget {
  final List<Ayah> ayahs;
  final int initialAyahIndex;

  SurahSlider({required this.ayahs, required this.initialAyahIndex, required Null Function(dynamic index) onAyahChanged});

  @override
  _SurahSliderState createState() => _SurahSliderState();
}

class _SurahSliderState extends State<SurahSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      if (currentIndex > 0) {
                        currentIndex--;
                      }
                    });
                  },
                  color: Colors.white,
                ),
                Text(
                  'Ayah ${widget.ayahs[currentIndex].numberInSurah}',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 18,
                  //   color: Colors.white,
                  //   fontFamily: GoogleFonts.amiri().fontFamily,
                  // ),
                    style: TextStyle(
                      fontFamily: 'Uthman', // Use the font family name specified in pubspec.yaml
                      fontSize: 26,
                      color: Colors.black, // Adjust the color as needed
                    ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      if (currentIndex < widget.ayahs.length - 1) {
                        currentIndex++;
                      } else {
                        Navigator.of(context).pop(); // Close popup
                      }
                    });
                  },
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.ayahs[currentIndex].text,
                  style:TextStyle(
                    fontFamily: 'Uthman', // Use the font family name specified in pubspec.yaml
                    fontSize: 26,
                    color: primaryColor, // Adjust the color as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
