import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_bloc.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_event.dart';
import 'package:islamy/features/home/tabs/quran/view_model/bloc/quran_bloc.dart';
import 'package:islamy/features/home/tabs/quran/view_model/bloc/quran_event.dart';
import 'package:islamy/features/home/tabs/hadith/views/screens/hadith_screen.dart';
import 'package:islamy/features/home/tabs/quran/views/screens/quran_screen.dart';
import 'package:islamy/features/home/tabs/radio/views/screens/radio_screen.dart';
import 'package:islamy/features/home/tabs/sebha/views/screens/sebha_screen.dart';
import 'package:islamy/features/home/tabs/timing/views/screens/timing_screen.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    const QuranScreen(),
    const HadithScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const TimingScreen(),
  ];

  HomeBloc() : super(HomeInitial()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<HomeState> emit) {
    selectedIndex = event.index;
    if (selectedIndex == 0) {
      BlocProvider.of<QuranBloc>(event.context).add(LoadQuranDataEvent());
    } else if (selectedIndex != 3) {
      BlocProvider.of<RadioBloc>(event.context).add(StopAudioEvent());
    }
    emit(TabChangedState(index: selectedIndex));
  }
}

