import '../../../data/models/azkar_model.dart';

abstract class AzkarStates {}

class AzkarInitialState extends AzkarStates {}

class AzkarLoadingState extends AzkarStates {}

class AzkarSuccessState extends AzkarStates {
  List<AzkarCategory> categories;
  AzkarSuccessState({required this.categories});
}

class AzkarErrorState extends AzkarStates {
  final String errorMessage;
  AzkarErrorState({required this.errorMessage});
}
