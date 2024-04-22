import 'package:flutter/material.dart';
import 'package:islamicappfinal/global/colors.dart';
import 'package:islamicappfinal/main_screen/home_screen_elements/remaining_activity.dart';
import 'home_screen_elements/collection.dart';
import 'home_screen_elements/date_screen.dart';
import 'more_components/ramzan_dua.dart';
import 'home_screen_elements/prayer_tracker.dart';
import 'home_screen_elements/ramdan_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? selectedAyah;

  const HomeScreen({Key? key, this.selectedAyah}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String seharTime;
  late String iftarTime;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initializePrayerTimes();
  }

  Future<void> initializePrayerTimes() async {
    try {
      await prayerTimesService.fetchPrayerTimes();
      setState(() {
        int seharHour = prayerTimesService.fajar.hour - 2;
        int seharMin = prayerTimesService.fajar.minute;
        int iftarHour = prayerTimesService.maghrib.hour;
        int iftarMin = prayerTimesService.maghrib.minute;

        seharTime = '$seharHour : ${seharMin.toString().padLeft(2, '0')}';
        iftarTime = '$iftarHour : ${iftarMin.toString().padLeft(2, '0')}';
        _isLoading = false; // Prayer times loaded, set isLoading to false
      });
    } catch (error) {
      // Handle error, show error message or retry option
      print('Error loading prayer times: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_left_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            title: TodayScreen(),
            elevation: 20,
            backgroundColor: primaryColor,
            centerTitle: true,
            pinned: true,
          ),
          // SizedBox(height: 20,),
          SliverList(

            delegate: SliverChildListDelegate([
              SizedBox(height: 20), // Add spacing between widgets
              RemainingActivity(),
              SizedBox(height: 20), // Add spacing between widgets
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  child: Categories(),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyCard(time: seharTime, title: "Sehar"),
                      MyCard(time: iftarTime, title: "Iftar")
                    ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                // color: primaryColor2,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  color: primaryColor2,
                  borderRadius: BorderRadius.circular(20),
                  child: PrayerTracker(),
                ),
              ),
              SizedBox(height: 20),
              _buildContainer(
                context,
                'Ghusal Sunnah',
                'assets/images/png/ghusal.jpg',
                    () => _showGhusalSteps(context),
              ),
              SizedBox(height: 20),
              _buildContainer(
                context,
                'Wudu Sunnah',
                'assets/images/png/wudu.jpg',
                    () => _showWuduSteps(context),
              ),
              SizedBox(height: 20),
              _buildContainer(
                context,
                'Rakaat',
                'assets/images/png/rakaat.jpeg',
                    () => _showRakatScreen(context),
              ),
              SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Opacity(
              opacity: 0.45, // Adjust the opacity value as needed
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200, // Adjust the height of the image as needed
              ),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showGhusalSteps(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: primaryColor,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sunnah way of making ghusal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor),
                ),
                Text(
                  'Ghusal Steps',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  '''State your intention (Niyyah)
1) Say Bismillah
2) Rinse your hands three times
3) Wash your private parts and any other impure part of the body thoroughly.
4) Perform Wudu (an Islamic practice of cleaning the body) as you do daily but don’t wash your feet yet.
5) If you are bathing on a platform or a stool where the water is rapidly flowing, then you need to perform the Wudu completely. But, if it feels like your feet will get dipped in the water, then wash them after you are through with the bath.
6) Wash your head thoroughly so that the water reaches the scalp. Men should clean their beards thoroughly too. Ghusl steps for ladies include thorough washing of hair, and if the hair is not in a plait, then it is important to wash it to the roots. Do not leave a single hair out otherwise, the Ghusl will be considered invalid. But, if a woman has her hair in a plait, then it is not necessary to open it, just wet the root of each hair.
7) Starting from the right side, pour water on the whole body. Do the same at the left side and then the entire body. Do this three times each and make certain that no area is left dry and thoroughly rub your hands all over the body while washing.
8) After the Ghusl, step away from the area and wash your right feet and then the left feet. But, if your feet have been washed during the process, then there is no need to wash them again.
9) Dry your body with a clean towel and dress up.''',
                  style: TextStyle(fontSize: 16, color: secondaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWuduSteps(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: primaryColor,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sunnah way of making Wudu',
                  style: TextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 10),
                // Image.asset(
                //   'assets/images/png/wudu_icon.jpg',
                //   width: double.infinity,
                //   height: 200,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 10),
                Text(
                  'Wudu Steps:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  '''1) Start with the intention (Niyyah) for Wudu.
2) Say Bismillah.
3) Wash your hands up to the wrist three times.
4) Rinse your mouth thoroughly three times.
5) Clean your nose three times.
6) Wash your face three times, from the hairline to the chin and from ear to ear.
7) Wash your forearms up to the elbows three times.
8) Wipe your head once, using wet hands from the front to the back, and back to the front.
9) Clean your ears once, using the index fingers to wipe inside and thumbs outside.
10) Finally, wash your feet up to the ankles, ensuring water reaches between the toes, three times each.''',
                  style: TextStyle(fontSize: 16, color: secondaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRakatScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: primaryColor,
            padding: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   'Rakat',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 10),
                SingleChildScrollView( // Make the image scrollable
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/png/prayer.jpeg',
                        width: 380, // Adjust width as needed
                        height: 350, // Adjust height as needed
                        // fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
