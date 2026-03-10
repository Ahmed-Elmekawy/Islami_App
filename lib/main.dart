import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/config/app_theme.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/core/utils/shared_pref_helper.dart';
import 'package:islamy/features/home/presentation/manager/hadith_bloc/hadith_cubit.dart';
import 'core/networking/dio_helper.dart';
import 'features/home/presentation/manager/home_bloc/home_cubit.dart';
import 'features/home/presentation/manager/quran_bloc/quran_cubit.dart';
import 'features/home/presentation/manager/radio_bloc/radio_cubit.dart';
import 'features/home/presentation/manager/sebha_bloc/sebha_cubit.dart';
import 'features/home/presentation/manager/timing_bloc/timing_cubit.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  DioHelper.init();
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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => QuranCubit()..loadQuranData()),
        BlocProvider(create: (context) => HadithCubit()..loadHadithsFile()),
        BlocProvider(create: (context) => SebhaCubit()),
        BlocProvider(create: (context) => RadioCubit()..getRadiosAndReciters()),
        BlocProvider(
          create: (context) => TimingCubit()..getPrayTiming(),
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
