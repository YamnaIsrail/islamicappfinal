import 'package:flutter/material.dart';
import 'package:islamicappfinal/features/Hadith/hadith_screen.dart';
import 'package:islamicappfinal/main_screen/home_screen.dart';
import 'package:islamicappfinal/onboarding/SplashScreen.dart';
import 'package:islamicappfinal/onboarding/splash_screen.dart';

import 'features/PrayerTimings/prayer_timings.dart';
import 'features/Quran/fetch_api.dart';
import 'features/todo_screens/surah_selection_screen.dart';


void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-NOOR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffe1b983)),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/quran': (context) => QuranApi(selectedNumber: 10,),
        '/prayer': (context) =>
            PrayerTimesPage(),
        '/qibla': (context) => Scaffold(),
        '/more': (context) => Scaffold(),
      },
      home: SplashScreen(),
    );
  }
}


