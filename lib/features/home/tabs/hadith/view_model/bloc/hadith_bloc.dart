import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/hadith_repository.dart';
import 'hadith_event.dart';
import 'hadith_state.dart';

class HadithBloc extends Bloc<HadithEvent, HadithState> {
  final HadithRepository repository;

  HadithBloc({required this.repository}) : super(HadithInitial()) {
    on<FetchHadithsEvent>(_onFetchHadiths);
  }

  Future<void> _onFetchHadiths(FetchHadithsEvent event, Emitter<HadithState> emit) async {
    emit(HadithLoading());
    final result = await repository.getHadiths();
    result.fold(
      (failure) => emit(HadithError(failure.message)),
      (data) => emit(HadithLoaded(hadiths: data)),
    );
  }
}



