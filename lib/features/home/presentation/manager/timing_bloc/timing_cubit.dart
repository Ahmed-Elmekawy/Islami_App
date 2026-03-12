import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islamy/features/home/presentation/manager/timing_bloc/timing_states.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/networking/dio_helper.dart';
import '../../../data/models/pray_timing_model.dart';

class TimingCubit extends Cubit<TimingStates> {
  TimingCubit() : super(TimingInitialState());

  static TimingCubit get(BuildContext context) => BlocProvider.of(context);

  void getPrayTiming() async {
    emit(TimingLoadingState());
    try {
      String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final response = await DioHelper.getData(
        methodUrl: "https://api.aladhan.com/v1/timingsByCity/$date",
        queryParameters: {"city": "cairo", "country": "egypt"},
      );
      final model = PrayerTimingModel.fromJson(response.data);
      emit(TimingSuccessState(data: model.data));
    } catch (e) {
      emit(TimingErrorState(errorMessage: e.toString()));
    }
  }

  DateTime _parsePrayerTime(Timings timings, String prayerName) {
    String rawTime;
    switch (prayerName) {
      case "Fajr":
        rawTime = timings.fajr;
        break;
      case "Sunrise":
        rawTime = timings.sunrise;
        break;
      case "Dhuhr":
        rawTime = timings.dhuhr;
        break;
      case "Asr":
        rawTime = timings.asr;
        break;
      case "Maghrib":
        rawTime = timings.maghrib;
        break;
      case "Isha":
        rawTime = timings.isha;
        break;
      default:
        rawTime = "00:00";
    }
    return DateFormat("HH:mm").parse(rawTime);
  }

  String getPrayerTime(Timings timings, String prayerName) {
    final parsedTime = _parsePrayerTime(timings, prayerName);
    return DateFormat("h:mm").format(parsedTime);
  }

  String getPeriod(Timings timings, String prayerName) {
    final parsedTime = _parsePrayerTime(timings, prayerName);
    return DateFormat("a").format(parsedTime);
  }

  Map<String, String> getNextPrayer(Timings timings) {
    String nextPrayerName = "Fajr";
    String nextPrayerTime = timings.fajr;
    DateTime now = DateTime.now();
    for (String name in prayersNames) {
      String timeStr = "";
      if (name == "Fajr") {
        timeStr = timings.fajr;
      } else if (name == "Sunrise") {
        timeStr = timings.sunrise;
      } else if (name == "Dhuhr") {
        timeStr = timings.dhuhr;
      } else if (name == "Asr") {
        timeStr = timings.asr;
      } else if (name == "Maghrib") {
        timeStr = timings.maghrib;
      } else if (name == "Isha") {
        timeStr = timings.isha;
      }
      DateTime prayerTime = DateFormat("HH:mm").parse(timeStr);
      DateTime compareTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );
      if (compareTime.isAfter(now)) {
        nextPrayerName = name;
        nextPrayerTime = timeStr;
        break;
      }
    }
    return {"name": nextPrayerName, "time": nextPrayerTime};
  }
}
