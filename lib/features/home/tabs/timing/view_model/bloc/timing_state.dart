import 'package:equatable/equatable.dart';

import '../../data/models/pray_timing_model.dart';

abstract class TimingState extends Equatable {
  const TimingState();

  @override
  List<Object?> get props => [];
}

class TimingInitial extends TimingState {}

class TimingLoading extends TimingState {}

class TimingLoaded extends TimingState {
  final Data timingData;

  const TimingLoaded({required this.timingData});

  @override
  List<Object?> get props => [timingData];
}

class TimingError extends TimingState {
  final String message;

  const TimingError(this.message);

  @override
  List<Object?> get props => [message];
}
