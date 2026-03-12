import '../../../data/models/radio_model.dart';
import '../../../data/models/reciters_model.dart';

abstract class RadioStates {}

class RadioInitialState extends RadioStates {}

class RadioLoadingState extends RadioStates {}

class RadioSuccessState extends RadioStates {
  final List<RadioModel> radios;
  final List<ReciterModel> reciters;
  final bool isRadioSelected;
  RadioSuccessState({
    required this.radios,
    required this.reciters,
    required this.isRadioSelected,
  });
}

class RadioErrorState extends RadioStates {
  final String errorMessage;
  RadioErrorState({required this.errorMessage});
}
