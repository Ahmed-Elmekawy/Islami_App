import 'package:equatable/equatable.dart';

class SuraModel extends Equatable {
  final int suraNumber;
  final String nameArabic;
  final String nameEnglish;
  final String versesCount;

  const SuraModel({
    required this.suraNumber,
    required this.nameArabic,
    required this.nameEnglish,
    required this.versesCount,
  });

  @override
  List<Object?> get props => [suraNumber, nameArabic, nameEnglish, versesCount];
}



