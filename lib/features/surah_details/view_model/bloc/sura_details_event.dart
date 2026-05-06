import 'package:equatable/equatable.dart';
import '../../../home/tabs/quran/data/models/sura_model.dart';

abstract class SuraDetailsEvent extends Equatable {
  const SuraDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSuraContentEvent extends SuraDetailsEvent {
  final SuraModel suraModel;

  const LoadSuraContentEvent({required this.suraModel});

  @override
  List<Object?> get props => [suraModel];
}

