import 'package:adhan_dart/adhan_dart.dart';


class PrayerTimeHelper {
  // Initialize time zones
 

  // Calculate prayer times for a specific location
  static Map<String, DateTime> getPrayerTimes({
    required double latitude,
    required double longitude,
    DateTime? date,
    Duration? timeZoneOffset
  }) {
    // Default to today's date if no date is provided
    date ??= DateTime.now();
    timeZoneOffset ??= date.timeZoneOffset;
    
    // Define the location
    final coordinates = Coordinates(latitude, longitude);

    // Define prayer time calculation method (e.g., Muslim World League)
    final params = CalculationMethod.karachi();
    params.madhab = Madhab.hanafi;

    // Calculate prayer times
    final prayerTimes = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params);

    return {
      "Sun Rise": convertToLocalTimeZone(prayerTimes.sunrise!,timeZoneOffset),
      'Fajr': convertToLocalTimeZone(prayerTimes.fajr!,timeZoneOffset),
      'Dhuhr': convertToLocalTimeZone(prayerTimes.dhuhr!,timeZoneOffset),
      'Asr': convertToLocalTimeZone(prayerTimes.asr!,timeZoneOffset),
      'Maghrib': convertToLocalTimeZone(prayerTimes.maghrib!,timeZoneOffset),
      'Isha': convertToLocalTimeZone(prayerTimes.isha!,timeZoneOffset),
    };
  }
}

DateTime convertToLocalTimeZone(DateTime dateTime, Duration offset) {
  // Get the local timezone offset of the device
  // final localOffset = DateTime.now().timeZoneOffset;

  // Adjust the time by adding the local offset
  final adjustedTime = dateTime.toUtc().add(offset);
  return adjustedTime;
}