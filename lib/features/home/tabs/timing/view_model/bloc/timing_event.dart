import 'package:equatable/equatable.dart';

abstract class TimingEvent extends Equatable {
  const TimingEvent();

  @override
  List<Object?> get props => [];
}

class FetchTimingEvent extends TimingEvent {}



