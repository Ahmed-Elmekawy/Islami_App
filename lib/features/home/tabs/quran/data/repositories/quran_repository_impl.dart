import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/utils/shared_pref_helper.dart';
import '../models/sura_model.dart';
import '../suras_data.dart';
import 'quran_repository.dart';

import '../../../../../../core/errors/error_handler.dart';

class QuranRepositoryImpl implements QuranRepository {
  static const _recentKey = 'mostRecently';

  @override
  Future<Either<Failure, List<SuraModel>>> getSurasList() async {
    try {
      // In a real app this might come from a database or API.
      return Right(quranSurasList);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<SuraModel>>> getRecentSuras() async {
    try {
      final List<String> recentNumbers = SharedPrefHelper.getData(_recentKey) ?? [];
      final List<SuraModel> recentSuras = [];
      
      for (var number in recentNumbers) {
        try {
          var foundSura = quranSurasList.firstWhere(
            (sura) => sura.suraNumber.toString() == number,
          );
          recentSuras.add(foundSura);
        } catch (_) {
          // ignore if sura not found
        }
      }
      return Right(recentSuras);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveRecentSura(SuraModel sura) async {
    try {
      List<String> recentNumbers = SharedPrefHelper.getData(_recentKey) ?? [];
      String suraNumber = sura.suraNumber.toString();
      
      recentNumbers.remove(suraNumber);
      recentNumbers.insert(0, suraNumber);
      
      if (recentNumbers.length > 10) {
        recentNumbers = recentNumbers.sublist(0, 10);
      }
      
      await SharedPrefHelper.saveData(_recentKey, recentNumbers);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}



