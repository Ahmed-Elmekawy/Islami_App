import 'package:equatable/equatable.dart';

abstract class SebhaEvent extends Equatable {
  const SebhaEvent();

  @override
  List<Object?> get props => [];
}

class SebhaClickedEvent extends SebhaEvent {}



