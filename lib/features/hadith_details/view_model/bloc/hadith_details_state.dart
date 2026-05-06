import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/hadith/data/models/hadith_model.dart';

abstract class HadithDetailsState extends Equatable {
  const HadithDetailsState();

  @override
  List<Object?> get props => [];
}

class HadithDetailsInitial extends HadithDetailsState {}

class HadithDetailsLoaded extends HadithDetailsState {
  final HadithModel hadith;
  const HadithDetailsLoaded(this.hadith);

  @override
  List<Object?> get props => [hadith];
}
