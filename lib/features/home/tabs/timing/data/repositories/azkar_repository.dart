import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/azkar_model.dart';

abstract class AzkarRepository {
  Future<Either<Failure, List<AzkarCategory>>> getAzkar();
}



