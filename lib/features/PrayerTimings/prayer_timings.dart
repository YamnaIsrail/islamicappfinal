//
//
// import 'package:flutter/material.dart';
// // import 'package:adhan_dart/adhan_dart.dart';
// import 'package:intl/intl.dart';
//
// import '../../../global/colors.dart';
// import 'custom_list_tile.dart';
// import 'prayer_time_service.dart';
//
//
//
// class PrayerTimesPage extends StatefulWidget {
//   const PrayerTimesPage({super.key});
//
//   @override
//   State<PrayerTimesPage> createState() => _PrayerTimesPageState();
// }
//
// class _PrayerTimesPageState extends State<PrayerTimesPage> {
//   final prayerTimesService = PrayerTimesService();
//
//   @override
//   void initState() {
//     super.initState();
//     loadPrayerTimes();
//   }
//
//   Future<void> loadPrayerTimes() async {
//     await prayerTimesService.fetchPrayerTimes();
//     setState(() {}); // Trigger a rebuild after fetching prayer times
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor2,
//       appBar: AppBar(
//         title: const Text('Prayer Times'),
//         backgroundColor: primaryColor,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             CustomListTile(
//               title: 'Fajr',
//               tileColor: primaryColor,
//               trailing: DateFormat('hh:mm a').format(prayerTimesService.fajar),
//             ),
//             const SizedBox(height: 30),
//             CustomListTile(
//               title: 'Sunrise',
//               tileColor: primaryColor,
//               trailing:
//               DateFormat('hh:mm a').format(prayerTimesService.sunrise),
//             ),
//             const SizedBox(height: 30),
//             CustomListTile(
//               title: 'Dhuhr',
//               tileColor: primaryColor,
//               trailing:
//               DateFormat('hh:mm a').format(prayerTimesService.dhuhr),
//             ),
//             const SizedBox(height: 30),
//             CustomListTile(
//               title: 'Asr',
//               tileColor: primaryColor,
//               trailing: DateFormat('hh:mm a').format(prayerTimesService.asar),
//             ),
//             const SizedBox(height: 30),
//             CustomListTile(
//               title: 'Maghrib',
//               tileColor: primaryColor,
//               trailing:
//               DateFormat('hh:mm a').format(prayerTimesService.maghrib),
//             ),
//             const SizedBox(height: 30),
//             CustomListTile(
//               title: 'Isha',
//               tileColor: primaryColor,
//               trailing:
//               DateFormat('hh:mm a').format(prayerTimesService.isha),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:islamicappfinal/features/PrayerTimings/prayer_drawer.dart';

import '../../../global/colors.dart';
import 'custom_list_tile.dart';
import 'prayer_time_service.dart';

class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({Key? key}) : super(key: key);

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  final prayerTimesService = PrayerTimesService();
  late String backgroundImage = 'assets/images/png/bg.jpg'; // Default background image

  @override
  void initState() {
    super.initState();
    loadPrayerTimes();
  }

  Future<void> loadPrayerTimes() async {
    await prayerTimesService.fetchPrayerTimes();
    setState(() {}); // Trigger a rebuild after fetching prayer times
  }

  void updateBackground(String prayerName) {
    setState(() {
      switch (prayerName) {
        case 'Fajr':
          backgroundImage = 'assets/images/praying_time/svg/morning.svg';
          break;
        case 'Dhuhr':
          backgroundImage = 'assets/images/praying_time/svg/noon.svg';
          break;
        case 'Asr':
          backgroundImage = 'assets/images/praying_time/svg/afternoon.svg';
          break;
        case 'Maghrib':
          backgroundImage = 'assets/images/praying_time/svg/evening.svg';
          break;
        case 'Isha':
          backgroundImage = 'assets/images/praying_time/svg/night.svg';
          break;
      // Add cases for other prayers if needed
        default:
          backgroundImage = 'assets/images/png/bg.jpg';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 40,
      ),
      endDrawer: PrayerDrawer(),
      body: Stack(
        children: [
          // Background image
          SvgPicture.asset(
            backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 320, 40, 0.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CustomListTile(
                  title: 'Fajr',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.fajar),
                  onTap: () => updateBackground('Fajr'),
                ),
                // const SizedBox(height: 3),
                CustomListTile(
                  title: 'Sunrise',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.sunrise),
                ),
                // const SizedBox(height: 3),
                CustomListTile(
                  title: 'Dhuhr',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.dhuhr),
                  onTap: () => updateBackground('Dhuhr'),
                ),
                // const SizedBox(height: 3),
                CustomListTile(
                  title: 'Asr',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.asar),
                  onTap: () => updateBackground('Asr'),
                ),
                // const SizedBox(height: 3),
                CustomListTile(
                  title: 'Maghrib',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.maghrib),
                  onTap: () => updateBackground('Maghrib'),
                ),
                // const SizedBox(height: 3),
                CustomListTile(
                  title: 'Isha',
                  tileColor: primaryColor,
                  trailing: DateFormat('hh:mm a').format(prayerTimesService.isha),
                  onTap: () => updateBackground('Isha'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
