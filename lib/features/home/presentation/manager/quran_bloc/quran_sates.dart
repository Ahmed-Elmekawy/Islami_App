import '../../../data/models/sura_model.dart';

abstract class QuranStates {}

class QuranInitialState extends QuranStates {}

class QuranDataLoadingState extends QuranStates {}

class QuranDataSuccessState extends QuranStates {
  final List<SuraModel> filteredSuras;
  final List<SuraModel> recentSuras;

  QuranDataSuccessState({
    required this.filteredSuras,
    required this.recentSuras,
  });
}

class QuranDataErrorState extends QuranStates {
  final String errorMessage;
  QuranDataErrorState({required this.errorMessage});
}

class MostRecentlyItemSuccessState extends QuranStates {}

class MostRecentlyItemErrorState extends QuranStates {
  final String errorMessage;

  MostRecentlyItemErrorState({required this.errorMessage});
}
