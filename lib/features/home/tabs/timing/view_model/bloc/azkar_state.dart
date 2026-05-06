import 'package:equatable/equatable.dart';
import '../../data/models/azkar_model.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object?> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final List<AzkarCategory> categories;

  const AzkarLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class AzkarError extends AzkarState {
  final String message;

  const AzkarError(this.message);

  @override
  List<Object?> get props => [message];
}



