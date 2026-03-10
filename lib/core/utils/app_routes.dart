import 'package:flutter/material.dart';
import '../../features/hadith_details/presentation/views/hadith_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/reciters_details/presentaion/views/reciter_details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/surah_details/presentation/views/sura_details_view.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/intro';
  static const String home = '/home';
  static const String surahDetails = '/surah_details';
  static const String hadithDetails = '/hadith_details';
  static const String reciterDetails = '/reciter_details';
  static const String azkarDetails = '/azkar_details';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (_) => SplashView(),
      onBoarding: (_) => OnBoardingView(),
      home: (_) => HomeView(),
      surahDetails: (_) => SuraDetailsView(),
      hadithDetails: (_) => HadithDetailsView(),
      reciterDetails: (_) => ReciterDetailsView(),
    };
  }
}
