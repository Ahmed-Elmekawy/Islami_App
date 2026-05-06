import 'package:equatable/equatable.dart';
import '../../data/models/sura_model.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class LoadQuranDataEvent extends QuranEvent {}

class FilterSurasEvent extends QuranEvent {
  final String query;
  const FilterSurasEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class SaveRecentSuraEvent extends QuranEvent {
  final SuraModel sura;
  const SaveRecentSuraEvent(this.sura);

  @override
  List<Object?> get props => [sura];
}



