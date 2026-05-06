import 'package:equatable/equatable.dart';
import '../../data/models/sura_model.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<SuraModel> allSuras;
  final List<SuraModel> filteredSuras;
  final List<SuraModel> recentSuras;

  const QuranLoaded({
    required this.allSuras,
    required this.filteredSuras,
    required this.recentSuras,
  });

  QuranLoaded copyWith({
    List<SuraModel>? allSuras,
    List<SuraModel>? filteredSuras,
    List<SuraModel>? recentSuras,
  }) {
    return QuranLoaded(
      allSuras: allSuras ?? this.allSuras,
      filteredSuras: filteredSuras ?? this.filteredSuras,
      recentSuras: recentSuras ?? this.recentSuras,
    );
  }

  @override
  List<Object?> get props => [allSuras, filteredSuras, recentSuras];
}

class QuranError extends QuranState {
  final String message;
  const QuranError(this.message);

  @override
  List<Object?> get props => [message];
}



