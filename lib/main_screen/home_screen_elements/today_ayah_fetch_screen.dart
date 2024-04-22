import 'package:flutter/material.dart'; // Import your Quran API service
import 'package:islamicappfinal/main_screen/home_screen_elements/today_ayah.dart';
import '../../features/Api_data/models/quran_api_model.dart';
import '../../features/Api_data/services/quran_api_services.dart'; // Import your TodayAyah widget

class QuranToday extends StatefulWidget {
  @override
  _QuranTodayState createState() => _QuranTodayState();
}

class _QuranTodayState extends State<QuranToday> {
  Quran? fetchedQuranData;

  @override
  void initState() {
    super.initState();
    fetchQuranData(); // Fetch Quran API data when the widget initializes
  }

  Future<void> fetchQuranData() async {
    try {
      Quran quran = await QuranServices().fetchQuranData();
      setState(() {
        fetchedQuranData = quran;
      });
    } catch (e) {
      print('Error fetching Quran data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Page'),
      ),
      body: fetchedQuranData != null // Check if Quran API data is fetched
          ? TodayAyah(quranData: fetchedQuranData!) // Pass the fetched Quran API data to TodayAyah widget
          : Center(child: CircularProgressIndicator()), // Show a loading indicator while data is being fetched
    );
  }
}
