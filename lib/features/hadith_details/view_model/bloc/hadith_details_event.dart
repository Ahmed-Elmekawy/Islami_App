import 'package:equatable/equatable.dart';
import 'package:islamy/features/home/tabs/hadith/data/models/hadith_model.dart';

abstract class HadithDetailsEvent extends Equatable {
  const HadithDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadHadithDetailsEvent extends HadithDetailsEvent {
  final HadithModel hadith;
  const LoadHadithDetailsEvent(this.hadith);

  @override
  List<Object?> get props => [hadith];
}
