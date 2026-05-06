import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/hadith_model.dart';

abstract class HadithRepository {
  Future<Either<Failure, List<HadithModel>>> getHadiths();
}



