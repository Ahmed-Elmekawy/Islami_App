import 'package:flutter_bloc/flutter_bloc.dart';
import 'reciter_details_event.dart';
import 'reciter_details_state.dart';

class ReciterDetailsBloc extends Bloc<ReciterDetailsEvent, ReciterDetailsState> {
  ReciterDetailsBloc() : super(ReciterDetailsInitial()) {
    on<LoadReciterDetailsEvent>((event, emit) {
      emit(ReciterDetailsLoaded(event.reciter));
    });
  }
}
