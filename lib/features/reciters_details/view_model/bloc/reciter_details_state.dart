import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/radio/data/models/reciter_model.dart';

abstract class ReciterDetailsState extends Equatable {
  const ReciterDetailsState();

  @override
  List<Object?> get props => [];
}

class ReciterDetailsInitial extends ReciterDetailsState {}

class ReciterDetailsLoaded extends ReciterDetailsState {
  final ReciterModel reciter;
  const ReciterDetailsLoaded(this.reciter);

  @override
  List<Object?> get props => [reciter];
}
