import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/quran_repository.dart';
import 'quran_event.dart';
import 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranRepository repository;

  QuranBloc({required this.repository}) : super(QuranInitial()) {
    on<LoadQuranDataEvent>(_onLoadData);
    on<FilterSurasEvent>(_onFilterSuras);
    on<SaveRecentSuraEvent>(_onSaveRecentSura);
  }

  Future<void> _onLoadData(LoadQuranDataEvent event, Emitter<QuranState> emit) async {
    emit(QuranLoading());

    final surasResult = await repository.getSurasList();
    final recentResult = await repository.getRecentSuras();

    surasResult.fold(
      (failure) => emit(QuranError(failure.message)),
      (allSuras) {
        recentResult.fold(
          (failure) => emit(QuranError(failure.message)),
          (recentSuras) {
            emit(QuranLoaded(
              allSuras: allSuras,
              filteredSuras: allSuras,
              recentSuras: recentSuras,
            ));
          },
        );
      },
    );
  }

  void _onFilterSuras(FilterSurasEvent event, Emitter<QuranState> emit) {
    if (state is QuranLoaded) {
      final currentState = state as QuranLoaded;
      final query = event.query.toLowerCase();
      
      if (query.isEmpty) {
        emit(currentState.copyWith(filteredSuras: currentState.allSuras));
        return;
      }

      final filtered = currentState.allSuras.where((sura) =>
          sura.nameArabic.contains(query) ||
          sura.nameEnglish.toLowerCase().contains(query)).toList();

      emit(currentState.copyWith(filteredSuras: filtered));
    }
  }

  Future<void> _onSaveRecentSura(SaveRecentSuraEvent event, Emitter<QuranState> emit) async {
    await repository.saveRecentSura(event.sura);
    add(LoadQuranDataEvent()); // Refresh data to show new recent list
  }
}



