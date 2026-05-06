import 'package:equatable/equatable.dart';

class PrayerTimingModel extends Equatable {
  final int? code;
  final String? status;
  final Data data;

  const PrayerTimingModel({this.code, this.status, required this.data});

  factory PrayerTimingModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimingModel(
      code: json['code'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }

  @override
  List<Object?> get props => [code, status, data];
}

class Data extends Equatable {
  final Timings timings;
  final Date date;

  const Data({required this.timings, required this.date});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: Timings.fromJson(json['timings']),
      date: Date.fromJson(json['date']),
    );
  }

  @override
  List<Object?> get props => [timings, date];
}

class Timings extends Equatable {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;

  const Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
    );
  }

  @override
  List<Object?> get props => [fajr, sunrise, dhuhr, asr, sunset, maghrib, isha, imsak, midnight];
}

class Date extends Equatable {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  const Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }

  @override
  List<Object?> get props => [readable, timestamp, hijri, gregorian];
}

class Hijri extends Equatable {
  final String date;
  final String day;
  final String year;
  final Month month;
  final Weekday weekday;
  final List<String> holidays;

  const Hijri({
    required this.date,
    required this.day,
    required this.year,
    required this.month,
    required this.weekday,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'],
      day: json['day'],
      year: json['year'],
      month: Month.fromJson(json['month']),
      weekday: Weekday.fromJson(json['weekday']),
      holidays: List<String>.from(json['holidays'] ?? []),
    );
  }

  @override
  List<Object?> get props => [date, day, year, month, weekday, holidays];
}

class Gregorian extends Equatable {
  final String date;
  final String day;
  final String year;
  final Month month;
  final Weekday weekday;

  const Gregorian({
    required this.date,
    required this.day,
    required this.year,
    required this.month,
    required this.weekday,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'],
      day: json['day'],
      year: json['year'],
      month: Month.fromJson(json['month']),
      weekday: Weekday.fromJson(json['weekday']),
    );
  }

  @override
  List<Object?> get props => [date, day, year, month, weekday];
}

class Month extends Equatable {
  final int number;
  final String en;
  final String? ar;

  const Month({required this.number, required this.en, this.ar});

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(number: json['number'], en: json['en'], ar: json['ar']);
  }

  @override
  List<Object?> get props => [number, en, ar];
}

class Weekday extends Equatable {
  final String en;
  final String? ar;

  const Weekday({required this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(en: json['en'], ar: json['ar']);
  }

  @override
  List<Object?> get props => [en, ar];
}



