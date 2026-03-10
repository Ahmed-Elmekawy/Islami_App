class PrayerTimingModel {
  int? code;
  String? status;
  final Data data; // تمت إزالة الـ ? وأضفنا final لضمان القيمة

  PrayerTimingModel({this.code, this.status, required this.data});

  factory PrayerTimingModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimingModel(
      code: json['code'],
      status: json['status'],
      // هنا نستخدم factory للتأكد من وجود البيانات أو رمي خطأ إذا كانت null
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final Timings timings;
  final Date date;

  Data({required this.timings, required this.date});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: Timings.fromJson(json['timings']),
      date: Date.fromJson(json['date']),
    );
  }
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;

  Timings({
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
}

class Date {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  Date({
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
}

class Hijri {
  final String date;
  final String day;
  final String year;
  final Month month;
  final Weekday weekday;
  final List<String> holidays;

  Hijri({
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
}

class Gregorian {
  final String date;
  final String day;
  final String year;
  final Month month;
  final Weekday weekday;

  Gregorian({
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
}

class Month {
  final int number;
  final String en;
  final String? ar; // الـ ar قد يكون null في الـ Gregorian فتركته اختيارياً

  Month({required this.number, required this.en, this.ar});

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(number: json['number'], en: json['en'], ar: json['ar']);
  }
}

class Weekday {
  final String en;
  final String? ar;

  Weekday({required this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(en: json['en'], ar: json['ar']);
  }
}
