import 'package:flutter/material.dart';
import 'package:islamicappfinal/global/colors.dart';

class AshraDuaWidget extends StatelessWidget {
  final String duaText;
  final String duaTranslation;
  final String duaTranslationUrdu;
  final String customText;
  final String imagePath;

  const AshraDuaWidget({
    Key? key,
    required this.duaText,
    required this.duaTranslation,
    required this.duaTranslationUrdu,
    required this.customText,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0), // Apply padding here
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Padding( // Apply padding here
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            duaText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            duaTranslation,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            duaTranslationUrdu,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                color: Colors.white,
                child: Text(
                  customText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstAshraDua extends StatelessWidget {
  const FirstAshraDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Ashra Duas'),
      ),
      body: ListView(
        children: const [
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/top.jpg',
            duaText: 'وَبِصَوْمِ غَدٍ نَّوَيْتُ مِنْ شَهْرِ رَمَضَانَ',
            duaTranslation:
            'I Intend to keep the fast for month of Ramadan',
            duaTranslationUrdu:
            'اورمیں نے ماہ رمضان کے کل کے روزے کی نیت کی.',
            customText: 'روزہ رکھنے کی نیت',
          ),
          AshraDuaWidget(
            imagePath: 'assets/images/png/top.jpg',
            duaText: 'اَللّٰهُمَّ اِنَّی لَکَ صُمْتُ وَبِکَ اٰمَنْتُ وَعَلَيْکَ تَوَکَّلْتُ وَعَلٰی رِزْقِکَ اَفْطَرْتُ.َ',
            duaTranslationUrdu:
            'اے اللہ!میں نے تیری خاطر روزہ رکھا اور تیرے اوپر ایمان لایا اور تجھ پر بھروسہ کیا اورتیرے رزق سے اسے کھول رہا ہوں۔',
            duaTranslation:
            'O Allah! I fasted for you and I believe in you and I put my trust in You and I break my fast with your sustenance.',
            customText: 'روزہ افطار کرنے کی دعا',
          ),

          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua2.jpg',
            duaText: 'ذَھَبَ الظَّمَأُوَابْتَلَّتِ الْعُرُوْقُ وَثَبَتَ الْاَجْرُ اِنْ شَآئَ اللّٰہُ۔َ',
            duaTranslationUrdu:
            'پیاس جاتی رہی اور رگیں تر ہوگئیں اور ثواب ثابت ہوگیا ان شاء اللہ تعالیٰ۔۔',
            duaTranslation:
            'Thirst has gone, the veins are moist, and the reward is assured, if Allah wills.',
            customText: 'افطارکرنے کے بعد کی دعا',
          ),

          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua3 (1).jpg',
            duaText: 'اَفْطَرَعِنْدَ کُمُ الصَّآئِمُوْنَ وَاَکَلَ طَعَامَکُمُ الْابَرَارُ وَصَلَّتْ عَلَیْکُمُ الْمَلَآئِکَةُ ۔َ',
            duaTranslationUrdu:
            'افطارکیا کریں تمہارے یہاں روزہ دار لوگ اور کھایا کریں تمہارا کھانا نیک لوگ اور رحمت کی دعا کیا کریں تمہارے لئے فرشتے ۔',
            duaTranslation:
            'May the fasting (people) break their fast in your home, and may the dutiful and pious eat your food, and may the angels send prayers upon you.',
            customText: 'کسی کے ہاں روزہ افطار کرے تو یہ دعاپڑھے',
          ),

          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua3 (2).jpg',
            duaText: 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغيث',
            duaTranslationUrdu:
            'پیاس جاتی رہی اور رگیں تر ہوگئیں اور ثواب ثابت ہوگیا ان شاء اللہ تعالیٰ۔۔',
            duaTranslation:
            'Oh, Everliving, The Everlasting, I seek Your help through Your mercy.',
            customText: 'افطارکرنے کے بعد کی دعا',
          ),

          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua3 (3).jpg',
            duaText: 'اَسْتَغْفِرُ اللہَ رَبِّی مِنْ کُلِّ زَنْبٍ وَّ اَتُوْبُ اِلَیْہِ',
            duaTranslationUrdu:
            'پیاس جاتی رہی اور رگیں تر ہوگئیں اور ثواب ثابت ہوگیا ان شاء اللہ تعالیٰ۔۔',
            duaTranslation:
            'I seek forgiveness from Allah for all my sins I committed and turn to Him.',
            customText: 'افطارکرنے کے بعد کی دعا',
          ),


          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/top.jpg',
            duaText: 'اَللَّهُمَّ أَجِرْنِي مِنَ النَّارِ',
            duaTranslationUrdu:
            'پیاس جاتی رہی اور رگیں تر ہوگئیں اور ثواب ثابت ہوگیا ان شاء اللہ تعالیٰ۔۔',
            duaTranslation:
            'O Allah, save me from the fire.',
            customText: 'افطارکرنے کے بعد کی دعا',
          ),
          // Add more AshraDuaWidget as needed
        ],
      ),
    );
  }
}
