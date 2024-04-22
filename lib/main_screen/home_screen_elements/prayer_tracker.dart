import 'package:flutter/material.dart';
import 'package:islamicappfinal/global/colors.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({Key? key}) : super(key: key);

  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  List<bool> isChecked = [false, false, false, false, false];
  double progress = 0.0;

  void _showSnackbar(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checkbox ${index + 1} clicked'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _updateProgress() {
    setState(() {
      int checkedCount = isChecked.where((element) => element).length;
      progress = checkedCount * 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: primaryColor2,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            'Salah Tracker',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked[index] = !isChecked[index];
                    _updateProgress();
                    if (_isCompleted()) {
                      _showCompletionDialog();
                    }
                  });
                },
                child: Checkbox(
                  value: isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                      _updateProgress();
                      if (_isCompleted()) {
                        _showCompletionDialog();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
          ),
        ],
      ),
    );
  }

  bool _isCompleted() {
    return isChecked.every((element) => element);
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You have completed all prayers.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
