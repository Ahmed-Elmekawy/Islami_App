import 'package:flutter_bloc/flutter_bloc.dart';
import 'hadith_details_event.dart';
import 'hadith_details_state.dart';

class HadithDetailsBloc extends Bloc<HadithDetailsEvent, HadithDetailsState> {
  HadithDetailsBloc() : super(HadithDetailsInitial()) {
    on<LoadHadithDetailsEvent>((event, emit) {
      emit(HadithDetailsLoaded(event.hadith));
    });
  }
}
