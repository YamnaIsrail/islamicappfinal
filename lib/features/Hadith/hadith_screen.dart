import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamicappfinal/design_elements/shimmer_effect.dart';
import 'dart:convert';

import 'package:islamicappfinal/global/colors.dart';

class HadithScreen extends StatefulWidget {
  @override
  _HadithScreenState createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  late Future<Hadith?> _hadithFuture;
  late HadithService _hadithService;
  String _selectedLanguage = 'Arabic'; // Default language set to Arabic

  // Available translation options
  List<String> _translationOptions = [
    'Arabic', 'Bengali', 'Bosnian', 'English', 'Spanish', 'Persian', 'French',
    'Icelandic', 'Russian', 'Tagalog', 'Turkish', 'Urdu', 'Chinese', 'Hindi',
    'Uighur', 'Kurdish', 'Hausa', 'Portuguese', 'Malay', 'Telugu', 'Swahili',
    'Burmese', 'Thai', 'German', 'Japanese', 'Pashto', 'Vietnamese', 'Assamese',
    'Albanian', 'Swedish', 'Czech', 'Gujarati', 'Amharic', 'Yoruba', 'Dutch',
    'Sinhala', 'Tamil'
  ];

  Map<String, String> _languageCodes = {
    'Arabic': 'ar', 'Bengali': 'bn', 'Bosnian': 'bs', 'English': 'en', 'Spanish': 'es',
    'Persian': 'fa', 'French': 'fr', 'Icelandic': 'is', 'Russian': 'ru', 'Tagalog': 'tl',
    'Turkish': 'tr', 'Urdu': 'ur', 'Chinese': 'zh', 'Hindi': 'hi', 'Uighur': 'ug',
    'Kurdish': 'ku', 'Hausa': 'ha', 'Portuguese': 'pt', 'Malay': 'ml', 'Telugu': 'te',
    'Swahili': 'sw', 'Burmese': 'my', 'Thai': 'th', 'German': 'de', 'Japanese': 'ja',
    'Pashto': 'ps', 'Vietnamese': 'vi', 'Assamese': 'as', 'Albanian': 'sq', 'Swedish': 'sv',
    'Czech': 'cs', 'Gujarati': 'gu', 'Amharic': 'am', 'Yoruba': 'yo', 'Dutch': 'nl',
    'Sinhala': 'si', 'Tamil': 'ta'
  };


  @override
  void initState() {
    super.initState();
    _hadithService = HadithService(
      apiUrl: "https://hadeethenc.com/api/v1/hadeeths/list/?language=${_languageCodes[_selectedLanguage]}&category_id=1&page=1&per_page=20",
    );
    _hadithFuture = _hadithService.fetchHadith();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor, // Set background color to cyan
      appBar: AppBar(
        centerTitle: true,
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
        title: Text('Hadith Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),backgroundColor: primaryColor,
        actions: [
          // Language selection button
          IconButton(
            icon: Icon(Icons.language, color: Colors.white,),
            onPressed: () {
              _showLanguageMenu(context);
            },
          ),
        ],
        elevation: 45,
      ),
      body: Center(
        child: FutureBuilder<Hadith?>(
          future: _hadithFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ShimmerEffect(); // Use LinearProgressIndicator for loading
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final Hadith? hadith = snapshot.data;
              return ListView.builder(
                itemCount: hadith!.data.length,
                itemBuilder: (context, index) {
                  Datum datum = hadith.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), // Circular border
                        color: primaryColor, // Green background color
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: ListTile(
                        title: Text(
                          datum.title ?? 'No Title',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'jameel.ttf',
                            color: Colors.white// Use Jameel font
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }

  // Function to show language selection menu
  void _showLanguageMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: DropdownButton<String>(
            value: _selectedLanguage,
            onChanged: (String? newValue) {
              setState(() {
                _selectedLanguage = newValue!;
                _hadithService = HadithService(
                  apiUrl: "https://hadeethenc.com/api/v1/hadeeths/list/?language=${_languageCodes[_selectedLanguage]}&category_id=1&page=1&per_page=20",
                );
                _hadithFuture = _hadithService.fetchHadith();
              });
              Navigator.pop(context);
            },
            items: _translationOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class Hadith {
  final List<Datum> data;
  final Meta meta;

  Hadith({
    required this.data,
    required this.meta,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Datum {
  final String id;
  final String title;
  final List<String> translations;

  Datum({
    required this.id,
    required this.title,
    required this.translations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      title: json['title'],
      translations: List<String>.from(json['translations'].map((x) => x)),
    );
  }
}

class Meta {
  final String currentPage;
  final int lastPage;
  final int totalItems;
  final String perPage;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.totalItems,
    required this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      totalItems: json['total_items'],
      perPage: json['per_page'],
    );
  }
}

class HadithService {
  final String apiUrl;

  HadithService({required this.apiUrl});

  Future<Hadith> fetchHadith() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Hadith.fromJson(responseData);
      } else {
        throw Exception('Failed to fetch Hadith');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
