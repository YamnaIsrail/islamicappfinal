import 'package:flutter/material.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class PrayerTimesService {
  late DateTime fajar;
  late DateTime sunrise;
  late DateTime dhuhr;
  late DateTime asar;
  late DateTime maghrib;
  late DateTime isha;

  Future<void> fetchPrayerTimes({String? selectedTimeZone}) async {
    tz.initializeTimeZones();
    final location = tz.getLocation('Asia/Kolkata');

    DateTime date = tz.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(34.33281, 73.19780);

    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    PrayerTimes prayerTimes =
    PrayerTimes(coordinates, date, params, precision: true);

    fajar = tz.TZDateTime.from(prayerTimes.fajr!, location);
    sunrise = tz.TZDateTime.from(prayerTimes.sunrise!, location);
    dhuhr = tz.TZDateTime.from(prayerTimes.dhuhr!, location);
    asar = tz.TZDateTime.from(prayerTimes.asr!, location);
    maghrib = tz.TZDateTime.from(prayerTimes.maghrib!, location);
    isha = tz.TZDateTime.from(prayerTimes.isha!, location);
  }
}

