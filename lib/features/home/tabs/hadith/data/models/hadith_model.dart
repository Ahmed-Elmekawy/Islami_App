import 'package:equatable/equatable.dart';

class HadithModel extends Equatable {
  final String title;
  final String content;
  final int hadithNumber;

  const HadithModel({
    required this.title,
    required this.content,
    required this.hadithNumber,
  });

  @override
  List<Object?> get props => [title, content, hadithNumber];
}



