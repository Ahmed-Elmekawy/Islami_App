import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends HomeEvent {
  final BuildContext context;
  final int index;

  const ChangeTabEvent({required this.context, required this.index});

  @override
  List<Object?> get props => [index];
}

