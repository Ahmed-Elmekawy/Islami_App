import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/config/app_theme.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/core/utils/shared_pref_helper.dart';
import 'package:islamy/core/di/injection_container.dart' as di;
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_bloc.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_event.dart';
import 'package:islamy/features/home/tabs/quran/view_model/bloc/quran_bloc.dart';
import 'package:islamy/features/home/tabs/quran/view_model/bloc/quran_event.dart';
import 'features/home/view_model/bloc/home_bloc.dart';
import 'package:islamy/features/home/tabs/sebha/view_model/bloc/sebha_bloc.dart';
import 'package:islamy/features/home/tabs/timing/view_model/bloc/timing_bloc.dart';
import 'package:islamy/features/home/tabs/timing/view_model/bloc/timing_event.dart';
import 'package:islamy/features/home/tabs/hadith/view_model/bloc/hadith_bloc.dart';
import 'package:islamy/features/home/tabs/hadith/view_model/bloc/hadith_event.dart';
import 'package:islamy/features/home/tabs/timing/view_model/bloc/azkar_bloc.dart';
import 'package:islamy/features/home/tabs/timing/view_model/bloc/azkar_event.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  await di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(const Islamy());
}

class Islamy extends StatelessWidget {
  const Islamy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(
          create: (context) => di.sl<QuranBloc>()..add(LoadQuranDataEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<HadithBloc>()..add(FetchHadithsEvent()),
        ),
        BlocProvider(create: (context) => di.sl<SebhaBloc>()),
        BlocProvider(
          create: (context) =>
              di.sl<RadioBloc>()..add(FetchRadiosAndRecitersEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<TimingBloc>()..add(FetchTimingEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<AzkarBloc>()..add(FetchAzkarEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
