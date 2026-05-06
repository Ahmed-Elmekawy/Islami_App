import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/timing/data/models/azkar_model.dart';

abstract class AzkarDetailsEvent extends Equatable {
  const AzkarDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAzkarDetailsEvent extends AzkarDetailsEvent {
  final AzkarCategory category;
  const LoadAzkarDetailsEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class DecrementZekrCountEvent extends AzkarDetailsEvent {
  final int index;
  const DecrementZekrCountEvent(this.index);

  @override
  List<Object?> get props => [index];
}
