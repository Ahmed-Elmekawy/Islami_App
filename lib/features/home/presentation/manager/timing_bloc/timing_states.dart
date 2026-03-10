import '../../../data/models/pray_timing_model.dart';

abstract class TimingStates {}

class TimingInitialState extends TimingStates {}

class TimingLoadingState extends TimingStates {}

class TimingSuccessState extends TimingStates {
  final Data data;
  TimingSuccessState({required this.data});
}

class TimingErrorState extends TimingStates {
  final String errorMessage;
  TimingErrorState({required this.errorMessage});
}
