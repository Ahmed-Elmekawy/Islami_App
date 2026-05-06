import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class TabChangedState extends HomeState {
  final int index;

  const TabChangedState({required this.index});

  @override
  List<Object?> get props => [index];
}

