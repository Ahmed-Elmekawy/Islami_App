import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/timing/data/models/azkar_model.dart';

abstract class AzkarDetailsState extends Equatable {
  const AzkarDetailsState();

  @override
  List<Object?> get props => [];
}

class AzkarDetailsInitial extends AzkarDetailsState {}

class AzkarDetailsLoaded extends AzkarDetailsState {
  final AzkarCategory category;
  final List<int> currentCounts;

  const AzkarDetailsLoaded(this.category, this.currentCounts);

  @override
  List<Object?> get props => [category, currentCounts];
}
