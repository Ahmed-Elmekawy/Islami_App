import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/errors/error_handler.dart';
import '../models/hadith_model.dart';
import 'hadith_repository.dart';

class HadithRepositoryImpl implements HadithRepository {
  @override
  Future<Either<Failure, List<HadithModel>>> getHadiths() async {
    try {
      final hadiths = await Future.wait(
        List.generate(50, (index) async {
          final int id = index + 1;
          final String content = await rootBundle.loadString(
            'assets/hadith/h$id.txt',
          );
          final List<String> lines = content.trim().split('\n');
          final String title = lines.first.trim();
          final String hadithContent = lines.skip(1).join('\n').trim();

          return HadithModel(
            title: title,
            content: hadithContent,
            hadithNumber: id,
          );
        }),
      );
      return Right(hadiths);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}



