import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:islamicappfinal/features/PrayerTimings/prayer_timings.dart';

import '../PrayerTimings/prayer_time_service.dart';

final prayerTimesService = PrayerTimesService();


void iftarAlarm() async{
  await prayerTimesService.fetchPrayerTimes();

  int maghribHour = prayerTimesService.maghrib.hour;

  if (maghribHour < 0) {
    maghribHour = 24 + maghribHour;
  }


  FlutterAlarmClock.createAlarm(
      hour: maghribHour,
      minutes: prayerTimesService.maghrib.minute);
}

void saharAlarm() {
  int alarmHour = prayerTimesService.fajar.hour - 2;

  if (alarmHour < 0) {
    alarmHour = 24 + alarmHour;
  }

  FlutterAlarmClock.createAlarm(
      hour: alarmHour,
      minutes: prayerTimesService.fajar.minute);

}