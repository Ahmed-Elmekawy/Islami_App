import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/home/tabs/radio/data/repositories/radio_repository.dart';
import '../../features/home/tabs/radio/data/repositories/radio_repository_impl.dart';
import '../../features/home/tabs/radio/view_model/bloc/radio_bloc.dart';
import '../../features/home/tabs/quran/data/repositories/quran_repository.dart';
import '../../features/home/tabs/quran/data/repositories/quran_repository_impl.dart';
import '../../features/home/tabs/quran/view_model/bloc/quran_bloc.dart';
import '../../features/home/tabs/sebha/view_model/bloc/sebha_bloc.dart';
import '../../features/home/tabs/timing/data/repositories/timing_repository.dart';
import '../../features/home/tabs/timing/data/repositories/timing_repository_impl.dart';
import '../../features/home/tabs/timing/view_model/bloc/timing_bloc.dart';
import '../../features/home/tabs/hadith/data/repositories/hadith_repository.dart';
import '../../features/home/tabs/hadith/data/repositories/hadith_repository_impl.dart';
import '../../features/home/tabs/hadith/view_model/bloc/hadith_bloc.dart';
import '../../features/home/tabs/timing/data/repositories/azkar_repository.dart';
import '../../features/home/tabs/timing/data/repositories/azkar_repository_impl.dart';
import '../../features/home/tabs/timing/view_model/bloc/azkar_bloc.dart';
import '../../features/surah_details/data/repositories/surah_details_repository.dart';
import '../../features/surah_details/data/repositories/surah_details_repository_impl.dart';
import '../../features/surah_details/view_model/bloc/sura_details_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. Blocs
  sl.registerFactory(() => RadioBloc(repository: sl()));
  sl.registerFactory(() => QuranBloc(repository: sl()));
  sl.registerFactory(() => SebhaBloc());
  sl.registerFactory(() => TimingBloc(repository: sl()));
  sl.registerFactory(() => HadithBloc(repository: sl()));
  sl.registerFactory(() => AzkarBloc(repository: sl()));
  sl.registerFactory(() => SuraDetailsBloc(repository: sl()));

  // 2. Repositories
  sl.registerLazySingleton<RadioRepository>(
    () => RadioRepositoryImpl(dio: sl()),
  );
  sl.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(),
  );
  sl.registerLazySingleton<TimingRepository>(
    () => TimingRepositoryImpl(dio: sl()),
  );
  sl.registerLazySingleton<HadithRepository>(
    () => HadithRepositoryImpl(),
  );
  sl.registerLazySingleton<AzkarRepository>(
    () => AzkarRepositoryImpl(),
  );
  sl.registerLazySingleton<SurahDetailsRepository>(
    () => SurahDetailsRepositoryImpl(),
  );

  // 3. Core/External
  sl.registerLazySingleton(() => Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  )));
}



