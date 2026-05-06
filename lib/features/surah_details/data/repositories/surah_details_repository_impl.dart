import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/error_handler.dart';
import 'surah_details_repository.dart';

class SurahDetailsRepositoryImpl implements SurahDetailsRepository {
  @override
  Future<Either<Failure, List<String>>> getSurahContent(int surahNumber) async {
    try {
      final String content = await rootBundle.loadString(
        'assets/suras/$surahNumber.txt',
      );
      
      final List<String> allLines = content.trim().split('\n');
      final List<String> pages = [];
      String currentPageContent = "";
      const int versesPerPage = 8;

      for (int i = 0; i < allLines.length; i++) {
        currentPageContent += "${allLines[i].trim()} ﴿${i + 1}﴾ ";
        if ((i + 1) % versesPerPage == 0 || i == allLines.length - 1) {
          pages.add(currentPageContent.trim());
          currentPageContent = "";
        }
      }
      
      return Right(pages);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}


