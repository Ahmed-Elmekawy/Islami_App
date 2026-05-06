import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/surah_details_repository.dart';
import 'sura_details_event.dart';
import 'sura_details_state.dart';

class SuraDetailsBloc extends Bloc<SuraDetailsEvent, SuraDetailsState> {
  final SurahDetailsRepository repository;

  SuraDetailsBloc({required this.repository}) : super(SuraDetailsInitial()) {
    on<LoadSuraContentEvent>(_onLoadContent);
  }

  Future<void> _onLoadContent(
    LoadSuraContentEvent event,
    Emitter<SuraDetailsState> emit,
  ) async {
    emit(SuraDetailsLoading());
    
    final result = await repository.getSurahContent(event.suraModel.suraNumber);
    
    result.fold(
      (failure) => emit(SuraDetailsError(message: failure.message)),
      (pages) => emit(SuraDetailsSuccess(suraPages: pages)),
    );
  }
}

