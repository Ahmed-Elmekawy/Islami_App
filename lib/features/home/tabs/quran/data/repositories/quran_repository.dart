import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/sura_model.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<SuraModel>>> getSurasList();
  Future<Either<Failure, List<SuraModel>>> getRecentSuras();
  Future<Either<Failure, void>> saveRecentSura(SuraModel sura);
}



