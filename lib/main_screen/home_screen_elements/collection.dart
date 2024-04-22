import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamicappfinal/features/Dua/dua_page.dart';
import 'package:islamicappfinal/features/PrayerTimings/prayer_timings.dart';
import 'package:islamicappfinal/features/Quran/fetch_api.dart';
import 'package:islamicappfinal/global/colors.dart';
import '../../features/Allah_name/name.dart';
import '../../features/Hadith/hadith_screen.dart';
import '../../features/quran_without_bookmark/Quran/fetch_api.dart';
import '../../features/tasbeeh_counter/tasbeeh_screens/tasbeeh_screen.dart';
import '../more_components/ramzan_dua.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor2,
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubContainer(image: 'assets/images/collection_icon/svg/quran.svg', text: 'Quran', onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (c) => QuranApi()));
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/hadees.svg', text: 'Hadees', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => HadithScreen()));
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/duas.svg', text: 'Dua', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => DuaPage()));
                  // Handle category 3 button tap
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/tasbih.svg', text: 'Tasbeeh', onPressed: () {
                  // Handle category 4 button tap
                  Navigator.push(context, MaterialPageRoute(builder: (c) => TasbeehScreen()));
                }),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubContainer(image: 'assets/images/collection_icon/svg/allah.svg', text: 'Asma-ul-Husna', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => AllahName()));

                  // Handle category 5 button tap
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/prayer_time_1.svg', text: 'Salah', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => PrayerTimesPage()));

                  // Handle category 6 button tap
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/kiblat.svg', text: 'Qibla', onPressed: () {
                  // Handle category 7 button tap
                }),
                SubContainer(image: 'assets/images/collection_icon/svg/other.svg', text: 'More', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => FirstAshraDua()));

                  // Handle category 8 button tap
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubContainer extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const SubContainer({required this.image, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image, width: 45, height: 45), // Use SvgPicture.asset for SVG images
            SizedBox(height: 7.0),
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}
