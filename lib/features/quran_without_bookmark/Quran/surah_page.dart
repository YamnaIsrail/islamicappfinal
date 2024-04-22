import 'package:flutter/material.dart';

import '../../../global/colors.dart';
import '../../Api_data/models/quran_api_model.dart';
// Import your Quran model

class SurahPage extends StatelessWidget {
  final Surah surah;

  SurahPage({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text(surah.name),
        backgroundColor: secondaryColor,
      centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: surah.ayahs.length,
        itemBuilder: (context, index) {
          Ayah ayah = surah.ayahs[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              title: Text('Ayah ${ayah.numberInSurah}'),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              subtitleTextStyle: TextStyle(
                fontFamily: 'Uthman',
                fontSize: 26,
                color: Colors.black,
              ),

              subtitle: Directionality(
                textDirection: TextDirection.rtl, // Set text direction to rtl
                child: Text(
                  ayah.text,
                  style: TextStyle(
                    fontFamily: 'Uthman', // Use the font family name specified in pubspec.yaml
                    fontSize: 26,
                    color: Colors.black, // Adjust the color as needed
                  ),
                ),
              ),
              // Add more widgets to display other properties if needed
            ),
          );
        },
      ),
    );
  }
}
