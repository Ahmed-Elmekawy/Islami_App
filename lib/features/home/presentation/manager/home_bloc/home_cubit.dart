import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/home/presentation/manager/home_bloc/home_states.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_cubit.dart';
import '../../views/tabs/hadith/hadith_tab.dart';
import '../../views/tabs/quran/quran_tab.dart';
import '../../views/tabs/radio/radio_tab.dart';
import '../../views/tabs/sebha/sebha_tab.dart';
import '../../views/tabs/timing/timing_tab.dart';
import '../quran_bloc/quran_cubit.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimingTab(),
  ];

  void changeBottomNav(BuildContext context, int index) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      QuranCubit.get(context).loadQuranData();
    } else if (selectedIndex != 3) {
      RadioCubit.get(context).stopAudio();
    }
    emit(ChangeBottomNavState());
  }
}
