import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/azkar_repository.dart';
import 'azkar_event.dart';
import 'azkar_state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  final AzkarRepository repository;

  AzkarBloc({required this.repository}) : super(AzkarInitial()) {
    on<FetchAzkarEvent>(_onFetchAzkar);
  }

  Future<void> _onFetchAzkar(FetchAzkarEvent event, Emitter<AzkarState> emit) async {
    emit(AzkarLoading());
    final result = await repository.getAzkar();
    result.fold(
      (failure) => emit(AzkarError(failure.message)),
      (categories) => emit(AzkarLoaded(categories: categories)),
    );
  }
}



