import 'package:equatable/equatable.dart';

abstract class SuraDetailsState extends Equatable {
  const SuraDetailsState();

  @override
  List<Object?> get props => [];
}

class SuraDetailsInitial extends SuraDetailsState {}

class SuraDetailsLoading extends SuraDetailsState {}

class SuraDetailsSuccess extends SuraDetailsState {
  final List<String> suraPages;

  const SuraDetailsSuccess({required this.suraPages});

  @override
  List<Object?> get props => [suraPages];
}

class SuraDetailsError extends SuraDetailsState {
  final String message;

  const SuraDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}


