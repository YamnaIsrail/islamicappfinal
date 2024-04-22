import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamicappfinal/global/colors.dart';// Import your constants file
import 'package:islamicappfinal/design_elements/shimmer_effect.dart'; // Import the ShimmerEffect widget if needed
import '../../features/Api_data/models/quran_api_model.dart';
 // Import your Quran API model

class TodayAyah extends StatelessWidget {
  final Quran quranData;

  TodayAyah({required this.quranData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Today\'s Ayah',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          SizedBox(height: 20),
          quranData != null
              ? _buildRandomAyah(quranData)
              : ShimmerEffect(), // You can replace ShimmerEffect with any loading indicator widget
        ],
      ),
    );
  }

  Widget _buildRandomAyah(Quran quranData) {
    Random random = Random();
    int surahIndex = random.nextInt(quranData.data.surahs.length);
    Surah surah = quranData.data.surahs[surahIndex];

    int ayahIndex = random.nextInt(surah.ayahs.length);
    Ayah ayah = surah.ayahs[ayahIndex];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            '${surah.name} ${ayah.numberInSurah}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          SizedBox(height: 10),
          Text(
            ayah.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
