import 'package:equatable/equatable.dart';

abstract class SebhaState extends Equatable {
  const SebhaState();

  @override
  List<Object?> get props => [];
}

class SebhaInitial extends SebhaState {}

class SebhaUpdateState extends SebhaState {
  final int counter;
  final double angle;
  final String currentZikr;

  const SebhaUpdateState({
    required this.counter,
    required this.angle,
    required this.currentZikr,
  });

  @override
  List<Object?> get props => [counter, angle, currentZikr];
}



