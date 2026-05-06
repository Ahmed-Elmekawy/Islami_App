import 'package:flutter/material.dart';
import '../../features/azkar_details/views/screens/azkar_details_view.dart';
import '../../features/hadith_details/views/screens/hadith_details_view.dart';
import '../../features/home/views/screens/home_view.dart';
import '../../features/onboarding/views/screens/onboarding_view.dart';
import '../../features/reciters_details/views/screens/reciter_details_view.dart';
import '../../features/splash/views/screens/splash_view.dart';
import '../../features/surah_details/views/screens/sura_details_view.dart';

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
      azkarDetails: (_) => AzkarDetailsView(),
    };
  }
}


