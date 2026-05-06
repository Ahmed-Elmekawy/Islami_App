import 'package:flutter_bloc/flutter_bloc.dart';
import 'azkar_details_event.dart';
import 'azkar_details_state.dart';

class AzkarDetailsBloc extends Bloc<AzkarDetailsEvent, AzkarDetailsState> {
  AzkarDetailsBloc() : super(AzkarDetailsInitial()) {
    on<LoadAzkarDetailsEvent>((event, emit) {
      final currentCounts = event.category.items
          .map((e) => int.tryParse(e.count) ?? 0)
          .toList();
      emit(AzkarDetailsLoaded(event.category, currentCounts));
    });

    on<DecrementZekrCountEvent>((event, emit) {
      if (state is AzkarDetailsLoaded) {
        final currentState = state as AzkarDetailsLoaded;
        final newCounts = List<int>.from(currentState.currentCounts);
        if (newCounts[event.index] > 0) {
          newCounts[event.index]--;
          emit(AzkarDetailsLoaded(currentState.category, newCounts));
        }
      }
    });
  }
}
