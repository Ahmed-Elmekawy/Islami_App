import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/radio/data/models/reciter_model.dart';

abstract class ReciterDetailsEvent extends Equatable {
  const ReciterDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadReciterDetailsEvent extends ReciterDetailsEvent {
  final ReciterModel reciter;
  const LoadReciterDetailsEvent(this.reciter);

  @override
  List<Object?> get props => [reciter];
}
