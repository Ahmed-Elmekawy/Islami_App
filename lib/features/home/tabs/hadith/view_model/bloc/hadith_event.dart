import 'package:equatable/equatable.dart';

abstract class HadithEvent extends Equatable {
  const HadithEvent();

  @override
  List<Object?> get props => [];
}

class FetchHadithsEvent extends HadithEvent {}
