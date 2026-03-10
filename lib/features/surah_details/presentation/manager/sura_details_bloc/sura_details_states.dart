abstract class SuraDetailsStates {}

class SuraDetailsInitialState extends SuraDetailsStates {}

class SuraDetailsLoadingState extends SuraDetailsStates {}

class SuraDetailsSuccessState extends SuraDetailsStates {
  final List<String> suraPages;

  SuraDetailsSuccessState({required this.suraPages});
}

class SuraDetailsErrorState extends SuraDetailsStates {
  final String errorMessage;

  SuraDetailsErrorState({required this.errorMessage});
}
