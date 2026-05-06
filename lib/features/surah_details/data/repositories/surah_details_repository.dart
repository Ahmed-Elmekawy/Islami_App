import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class SurahDetailsRepository {
  Future<Either<Failure, List<String>>> getSurahContent(int surahNumber);
}


