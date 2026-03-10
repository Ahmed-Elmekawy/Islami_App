import '../../../data/models/hadith_model.dart';

abstract class HadithStates {}

class HadithInitialState extends HadithStates {}

class HadithDataLoadingState extends HadithStates {}

class HadithDataSuccessState extends HadithStates {
  final List<HadithModel> hadiths;

  HadithDataSuccessState({required this.hadiths});
}

class HadithDataErrorState extends HadithStates {
  final String errorMessage;

  HadithDataErrorState({required this.errorMessage});
}